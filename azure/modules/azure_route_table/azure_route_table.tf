resource "azurerm_route_table" "route_table" {

  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  name                = var.name
}

output "route_table" {
  value = azurerm_route_table.route_table
}