variable "project_id" { type=string }
variable "region" { type=string; default="us-central1" }
variable "zone" { type=string; default="us-central1-a" }
variable "project_name" { type=string; default="terraform-enterprise-platform" }
variable "admin_cidr" { type=string }
variable "vpc_cidr_by_environment" {
  type=map(string)
  default={ dev="10.210.0.0/16", staging="10.220.0.0/16", prod="10.230.0.0/16" }
}
variable "machine_type_by_environment" {
  type=map(string)
  default={ dev="e2-micro", staging="e2-micro", prod="e2-small" }
}
