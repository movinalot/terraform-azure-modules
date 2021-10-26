module "module_azure_route_table" {
  for_each = var.route_tables

  source = "../azure/modules/azure_route_table"

  resource_group_name     = module.module_azure_resource_group.resource_group.name
  resource_group_location = module.module_azure_resource_group.resource_group.location
  name                    = each.value.name
}

output "route_tables" {
  value = module.module_azure_route_table[*]
}
