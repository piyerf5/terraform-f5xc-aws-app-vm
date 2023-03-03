# terraform-f5xc-aws-app-vm
Terraform module to create a workload in AWS using a VM (EC2) and published via the AWS VPC Site created by XC.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_volterra"></a> [volterra](#requirement\_volterra) | 0.11.18 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_volterra"></a> [volterra](#provider\_volterra) | 0.11.18 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.webserver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [volterra_http_loadbalancer.aws](https://registry.terraform.io/providers/volterraedge/volterra/0.11.18/docs/resources/http_loadbalancer) | resource |
| [volterra_origin_pool.aws](https://registry.terraform.io/providers/volterraedge/volterra/0.11.18/docs/resources/origin_pool) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_search_name"></a> [ami\_search\_name](#input\_ami\_search\_name) | AWS AMI search filter to find correct image (Ubuntu) for region | `string` | `"ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20230112"` | no |
| <a name="input_awsAz1"></a> [awsAz1](#input\_awsAz1) | Availability zone, will dynamically choose one if left empty | `string` | `null` | no |
| <a name="input_awsAz2"></a> [awsAz2](#input\_awsAz2) | Availability zone, will dynamically choose one if left empty | `string` | `null` | no |
| <a name="input_awsAz3"></a> [awsAz3](#input\_awsAz3) | Availability zone, will dynamically choose one if left empty | `string` | `null` | no |
| <a name="input_awsRegion"></a> [awsRegion](#input\_awsRegion) | aws region | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The DNS domain name that will be used as common parent generated DNS name of loadbalancers | `string` | n/a | yes |
| <a name="input_f5demo_app"></a> [f5demo\_app](#input\_f5demo\_app) | F5 demo app function (ex. website, frontend, backend, text) | `string` | n/a | yes |
| <a name="input_f5demo_color"></a> [f5demo\_color](#input\_f5demo\_color) | F5 demo app color | `string` | n/a | yes |
| <a name="input_f5demo_nodename"></a> [f5demo\_nodename](#input\_f5demo\_nodename) | F5 demo app node name | `string` | n/a | yes |
| <a name="input_instanceSuffix"></a> [instanceSuffix](#input\_instanceSuffix) | n/a | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Volterra application namespace | `string` | n/a | yes |
| <a name="input_projectPrefix"></a> [projectPrefix](#input\_projectPrefix) | projectPrefix name for tagging | `string` | n/a | yes |
| <a name="input_resourceOwner"></a> [resourceOwner](#input\_resourceOwner) | Owner of the deployment for tagging purposes | `string` | n/a | yes |
| <a name="input_site_name"></a> [site\_name](#input\_site\_name) | The XC site name | `string` | n/a | yes |
| <a name="input_spokeSecurityGroup"></a> [spokeSecurityGroup](#input\_spokeSecurityGroup) | Security group for the spoke VPC | `string` | `null` | no |
| <a name="input_spokeWorkloadSubnets"></a> [spokeWorkloadSubnets](#input\_spokeWorkloadSubnets) | n/a | `map` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH public key used to create an EC2 keypair | `string` | `null` | no |
| <a name="input_trusted_ip"></a> [trusted\_ip](#input\_trusted\_ip) | IP to allow external access | `string` | n/a | yes |
| <a name="input_volterraTenant"></a> [volterraTenant](#input\_volterraTenant) | Tenant of Volterra | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_webserver_private_ip"></a> [webserver\_private\_ip](#output\_webserver\_private\_ip) | Private IP address of web server |
<!-- END_TF_DOCS -->