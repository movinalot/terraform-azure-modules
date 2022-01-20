locals {
  subnet_route_table_associations = {
    "subnet-protected" = {
      subnet_id      = "protected"
      route_table_id = "rt-protected"
    }
  }
}

module "module_azure_subnet_route_table_association" {
  for_each = local.subnet_route_table_associations

  source = "../azure/modules/azure_subnet_route_table_association"

  subnet_id      = module.module_azure_subnet[each.value.subnet_id].subnet.id
  route_table_id = module.module_azure_route_table[each.value.route_table_id].route_table.id
}

output "subnet_route_table_associations" {
  value = module.module_azure_subnet_route_table_association[*]
}
