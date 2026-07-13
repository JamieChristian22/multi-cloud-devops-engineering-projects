locals {
  environment = contains(["dev","staging","prod"], terraform.workspace) ? terraform.workspace : "dev"
  name_prefix = "${var.project_name}-${local.environment}"
}
module "network" {
  source="../../modules/aws-network"
  name_prefix=local.name_prefix
  vpc_cidr=var.vpc_cidr_by_environment[local.environment]
}
module "compute" {
  source="../../modules/aws-compute"
  name_prefix=local.name_prefix
  vpc_id=module.network.vpc_id
  public_subnet_id=module.network.public_subnet_ids[0]
  instance_type=var.instance_type_by_environment[local.environment]
  admin_cidr=var.admin_cidr
}
