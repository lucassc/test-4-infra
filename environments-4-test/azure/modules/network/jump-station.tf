
resource "azurerm_resource_group" "jump_station_rg" {
  name     = "${var.project_name}-${var.environment}-jump-station"
  location = var.location
}


resource "azurerm_subnet" "jump-station" {
  name                 = "${var.project_name}-${var.environment}-jump-station-subnet"
  resource_group_name  = azurerm_resource_group.network_resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.jump_station_subnet_address]
}
