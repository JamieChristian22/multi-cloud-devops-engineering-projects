output "environment" { value=local.environment }
output "resource_group_name" { value=azurerm_resource_group.this.name }
output "vnet_id" { value=module.network.vnet_id }
output "public_subnets" { value=module.network.public_subnet_ids }
output "private_subnets" { value=module.network.private_subnet_ids }
output "vm_id" { value=module.compute.vm_id }
output "public_ip" { value=module.compute.public_ip }
