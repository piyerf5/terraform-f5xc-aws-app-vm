variable "instance_suffix" {
  type = string
}
variable "project_prefix" {
  type        = string
  description = "projectPrefix name for tagging"
}
variable "resource_owner" {
  type        = string
  description = "Owner of the deployment for tagging purposes"
}
variable "domain_name" {
  type        = string
  description = "The DNS domain name that will be used as common parent generated DNS name of loadbalancers"
}
variable site_name {
  type        = string
  description = "The XC site name"
}
variable "volterra_tenant" {
  description = "Tenant of Volterra"
  type        = string
}
variable "namespace" {
  description = "Volterra application namespace"
  type        = string
}
variable "aws_region" {
  description = "aws region"
  type        = string
}
variable "ssh_key" {
  description = "SSH public key used to create an EC2 keypair"
  type        = string
  default     = null
}
variable "spoke_security_group" {
  description = "Security group for the spoke VPC"
  type        = string
  default     = null
}
variable "aws_az1" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = null
}
variable "aws_az2" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = null
}
variable "aws_az3" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = null
}
variable "spoke_workload_subnets" {
  type = map
}
variable "ami_search_name" {
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20230112"
  description = "AWS AMI search filter to find correct image (Ubuntu) for region"
}
variable "f5demo_app" {
  description = "F5 demo app function (ex. website, frontend, backend, text)"
  type        = string
}
variable "f5demo_nodename" {
  description = "F5 demo app node name"
  type        = string
}
variable "f5demo_color" {
  description = "F5 demo app color"
  type        = string
}
