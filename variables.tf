variable "instanceSuffix" {
  type = string
}
variable "projectPrefix" {
  type        = string
  description = "projectPrefix name for tagging"
}
variable "resourceOwner" {
  type        = string
  description = "Owner of the deployment for tagging purposes"
}
variable "trusted_ip" {
  type        = string
  description = "IP to allow external access"
}
variable "domain_name" {
  type        = string
  description = "The DNS domain name that will be used as common parent generated DNS name of loadbalancers"
}
variable "awsRegion" {
  description = "aws region"
  type        = string
}
variable "ssh_key" {
  description = "SSH public key used to create an EC2 keypair"
  type        = string
  default     = null
}
variable "spokeSecurityGroup" {
  description = "Security group for the spoke VPC"
  type        = string
  default     = null
}
variable "awsAz1" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = null
}
variable "awsAz2" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = null
}
variable "awsAz3" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = null
}
variable "spokeWorkloadSubnets" {
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
