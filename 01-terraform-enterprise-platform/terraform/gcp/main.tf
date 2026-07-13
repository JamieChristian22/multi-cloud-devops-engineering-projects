locals {
  environment=contains(["dev","staging","prod"],terraform.workspace)?terraform.workspace:"dev"
  name_prefix="${var.project_name}-${local.environment}"
}
module "network" {
  source="../../modules/gcp-network"
  name_prefix=local.name_prefix
  region=var.region
  vpc_cidr=var.vpc_cidr_by_environment[local.environment]
  admin_cidr=var.admin_cidr
}
module "compute" {
  source="../../modules/gcp-compute"
  name_prefix=local.name_prefix
  machine_type=var.machine_type_by_environment[local.environment]
  zone=var.zone
  public_subnet_id=module.network.public_subnet_id
}
