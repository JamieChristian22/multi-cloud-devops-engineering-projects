variable "name" { type = string }
variable "vpc_cidr" { type = string }
output "design" { value = { name = var.name, cidr = var.vpc_cidr, topology = "two-az-public-private" } }
