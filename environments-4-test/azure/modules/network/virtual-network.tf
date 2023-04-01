resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.project_name}-${var.environment}-vnet"
  location            = azurerm_resource_group.network_resource_group.location
  resource_group_name = azurerm_resource_group.network_resource_group.name
  address_space       = ["${var.virtual_network_address}"]
}
