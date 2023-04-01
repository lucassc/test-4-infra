output "vnet_resource_group" {
  description = "The Virtual Network Resource Group name"
  value       = azurerm_resource_group.network_resource_group.name
}

output "vnet_name" {
  description = "The Virtual Network name"
  value       = azurerm_virtual_network.virtual_network.name
}

output "vnet_id" {
  description = "The Virtual Network Id"
  value       = azurerm_virtual_network.virtual_network.id
}
