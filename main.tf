########################### Providers ##########################

terraform {
  required_version = "~> 1.0"

  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = "0.11.18"
    }
    aws = "~> 4.0"
  }
}

provider "aws" {
  region = var.awsRegion
}

########################### AWS Availibility Zones ##########################

# Retrieve AZ values
data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  awsAz1 = var.awsAz1 != null ? var.awsAz1 : data.aws_availability_zones.available.names[0]
  awsAz2 = var.awsAz2 != null ? var.awsAz1 : data.aws_availability_zones.available.names[1]
  awsAz3 = var.awsAz3 != null ? var.awsAz1 : data.aws_availability_zones.available.names[2]
}

############################ AMI ############################

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = [var.ami_search_name]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

############################ Locals ############################

# Onboard files
locals {
  user_data = templatefile("${path.module}/cloud-config.yml", {
    f5demo_app      = var.f5demo_app
    f5demo_nodename = var.f5demo_nodename
    f5demo_color    = var.f5demo_color
  })
}

############################ Compute ############################

resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.large"
  subnet_id              = var.spokeWorkloadSubnets["az1"].id
  vpc_security_group_ids = [var.spokeSecurityGroup]
  key_name               = var.ssh_key
  user_data              = local.user_data

  tags = {
    Name  = format("%s-webserver-%s", var.projectPrefix, var.instanceSuffix)
    Owner = var.resourceOwner
  }
}

############################ XC HTTP LB and Origin Pool ############################

resource "volterra_origin_pool" "aws" {
  name                   = format("%s-aws-%s", var.projectPrefix, var.instanceSuffix)
  namespace              = var.namespace
  endpoint_selection     = "DISTRIBUTED"
  loadbalancer_algorithm = "LB_OVERRIDE"
  port                   = 80
  no_tls                 = true

  origin_servers {
    private_ip {
      ip = aws_instance.webserver.private_ip
      site_locator {
        site {
          tenant    = var.volterraTenant
          namespace = "system"
          name      = var.site_name
        }
      }
      inside_network = true
    }

    labels = {
      Owner = var.resourceOwner
    }
  }
}

resource "volterra_http_loadbalancer" "aws" {
  name                            = format("%s-aws-%s", var.projectPrefix, var.instanceSuffix)
  namespace                       = var.namespace
  no_challenge                    = true
  domains                         = [var.domain_name]
  random                          = true
  disable_rate_limit              = true
  service_policies_from_namespace = true
  disable_waf                     = true

  advertise_on_public_default_vip = true

  default_route_pools {
    pool {
      name = volterra_origin_pool.aws.name
    }
  }

  http {
    dns_volterra_managed = true
  }

  labels = {
    Owner = var.resourceOwner
  }
}
