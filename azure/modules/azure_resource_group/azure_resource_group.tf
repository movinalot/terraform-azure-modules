resource "azurerm_resource_group" "resource_group" {

  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    environment = var.resource_group_name
  }
}

output "resource_group" {
  value = {
    name     = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location
  }
}