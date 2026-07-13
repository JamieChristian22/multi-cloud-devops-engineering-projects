resource "azurerm_public_ip" "this" {
  name="${var.name_prefix}-pip"; location=var.location; resource_group_name=var.resource_group_name
  allocation_method="Static"; sku="Standard"
}
resource "azurerm_network_interface" "this" {
  name="${var.name_prefix}-nic"; location=var.location; resource_group_name=var.resource_group_name
  ip_configuration {
    name="primary"; subnet_id=var.public_subnet_id; private_ip_address_allocation="Dynamic"; public_ip_address_id=azurerm_public_ip.this.id
  }
}
resource "azurerm_linux_virtual_machine" "this" {
  name="${var.name_prefix}-vm"; resource_group_name=var.resource_group_name; location=var.location
  size=var.vm_size; admin_username=var.admin_username; network_interface_ids=[azurerm_network_interface.this.id]
  admin_ssh_key { username=var.admin_username; public_key=var.ssh_public_key }
  os_disk { caching="ReadWrite"; storage_account_type="Standard_LRS" }
  source_image_reference { publisher="Canonical"; offer="0001-com-ubuntu-server-jammy"; sku="22_04-lts-gen2"; version="latest" }
}
