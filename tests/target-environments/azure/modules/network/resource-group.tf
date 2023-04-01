resource "azurerm_resource_group" "network_resource_group" {
  name     = "${var.project_name}-${var.environment}-${var.module_name}-rg"
  location = var.location
}
