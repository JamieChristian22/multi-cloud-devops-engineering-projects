locals {
  environment=contains(["dev","staging","prod"],terraform.workspace)?terraform.workspace:"dev"
  name_prefix="${var.project_name}-${local.environment}"
}
resource "azurerm_resource_group" "this" {
  name="rg-${local.name_prefix}"; location=var.location
  tags={ Environment=local.environment, Project=var.project_name, ManagedBy="Terraform", Owner="CloudEngineering" }
}
module "network" {
  source="../../modules/azure-network"
  name_prefix=local.name_prefix
  resource_group_name=azurerm_resource_group.this.name
  location=var.location
  vnet_cidr=var.vnet_cidr_by_environment[local.environment]
  admin_cidr=var.admin_cidr
}
module "compute" {
  source="../../modules/azure-compute"
  name_prefix=local.name_prefix
  resource_group_name=azurerm_resource_group.this.name
  location=var.location
  public_subnet_id=module.network.public_subnet_ids[0]
  vm_size=var.vm_size_by_environment[local.environment]
  admin_username=var.admin_username
  ssh_public_key=var.ssh_public_key
}
