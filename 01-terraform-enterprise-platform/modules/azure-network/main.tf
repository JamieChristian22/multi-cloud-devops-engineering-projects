resource "azurerm_virtual_network" "this" {
  name                = "${var.name_prefix}-vnet"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet" "public" {
  count = 2
  name = "${var.name_prefix}-public-${count.index + 1}"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes = [cidrsubnet(var.vnet_cidr, 8, count.index)]
}
resource "azurerm_subnet" "private" {
  count = 2
  name = "${var.name_prefix}-private-${count.index + 1}"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes = [cidrsubnet(var.vnet_cidr, 8, count.index + 10)]
}
resource "azurerm_network_security_group" "public" {
  name = "${var.name_prefix}-public-nsg"
  location = var.location
  resource_group_name = var.resource_group_name
  security_rule {
    name="AllowHTTP"; priority=100; direction="Inbound"; access="Allow"; protocol="Tcp"
    source_port_range="*"; destination_port_range="80"; source_address_prefix="*"; destination_address_prefix="*"
  }
  security_rule {
    name="AllowSSHFromAdmin"; priority=110; direction="Inbound"; access="Allow"; protocol="Tcp"
    source_port_range="*"; destination_port_range="22"; source_address_prefix=var.admin_cidr; destination_address_prefix="*"
  }
}
resource "azurerm_subnet_network_security_group_association" "public" {
  count=2
  subnet_id=azurerm_subnet.public[count.index].id
  network_security_group_id=azurerm_network_security_group.public.id
}
