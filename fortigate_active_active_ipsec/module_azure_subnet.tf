module "module_azure_subnet" {
  for_each = var.subnets

  source = "../azure/modules/azure_subnet"

  resource_group_name     = module.module_azure_resource_group.resource_group.name
  resource_group_location = module.module_azure_resource_group.resource_group.location
  name                    = each.value.name
  vnet_name               = each.value.vnet_name
  address_prefixes        = each.value.address_prefixes

  depends_on = [
    module.module_azure_virtual_network
  ]
}

output "subnets" {
  value = module.module_azure_subnet[*]
}
