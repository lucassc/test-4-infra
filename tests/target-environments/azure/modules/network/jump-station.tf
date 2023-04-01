
resource "azurerm_resource_group" "jump_station_rg" {
  name     = "${var.project_name}-${var.environment}-jump-station-rg"
  location = var.location
}


resource "azurerm_subnet" "jump_station" {
  name                 = "${var.project_name}-${var.environment}-jump-station-subnet"
  resource_group_name  = azurerm_resource_group.network_resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.jump_station_subnet_address]
}

resource "azurerm_network_security_group" "network_security_group" {
  name                = "${var.project_name}-${var.environment}-jump-station-nsg"
  location            = var.location
  resource_group_name = azurerm_virtual_network.virtual_network.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
  subnet_id                 = azurerm_subnet.jump_station.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}
