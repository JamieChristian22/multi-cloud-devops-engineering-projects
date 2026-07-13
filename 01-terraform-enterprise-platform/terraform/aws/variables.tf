variable "aws_region" { type=string; default="us-east-1" }
variable "project_name" { type=string; default="terraform-enterprise-platform" }
variable "admin_cidr" { type=string; description="Approved administrator CIDR" }
variable "vpc_cidr_by_environment" {
  type=map(string)
  default={ dev="10.10.0.0/16", staging="10.20.0.0/16", prod="10.30.0.0/16" }
}
variable "instance_type_by_environment" {
  type=map(string)
  default={ dev="t3.micro", staging="t3.micro", prod="t3.small" }
}
