variable "subscription_id" { type=string }
variable "location" { type=string; default="East US" }
variable "project_name" { type=string; default="terraform-enterprise-platform" }
variable "admin_cidr" { type=string }
variable "admin_username" { type=string; default="azureadmin" }
variable "ssh_public_key" { type=string }
variable "vnet_cidr_by_environment" {
  type=map(string)
  default={ dev="10.110.0.0/16", staging="10.120.0.0/16", prod="10.130.0.0/16" }
}
variable "vm_size_by_environment" {
  type=map(string)
  default={ dev="Standard_B1s", staging="Standard_B1s", prod="Standard_B2s" }
}
