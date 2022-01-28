resource "azurerm_resource_group" "resource_group" {

  name     = var.name
  location = var.location

  tags = {
    environment = var.name
  }
}

output "resource_group" {
  value = {
    name     = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location
  }
}