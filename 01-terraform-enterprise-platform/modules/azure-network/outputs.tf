output "vnet_id" { value = azurerm_virtual_network.this.id }
output "public_subnet_ids" { value = azurerm_subnet.public[*].id }
output "private_subnet_ids" { value = azurerm_subnet.private[*].id }
