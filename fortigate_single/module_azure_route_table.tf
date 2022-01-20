locals {
  route_tables = {
    "rt-protected" = { name = "rt-protected" }
  }
}

module "module_azure_route_table" {
  for_each = local.route_tables

  source = "../azure/modules/azure_route_table"

  resource_group_name = module.module_azure_resource_group.resource_group.name
  location            = module.module_azure_resource_group.resource_group.location
  name                = each.value.name
}

output "route_tables" {
  value = module.module_azure_route_table[*]
}
