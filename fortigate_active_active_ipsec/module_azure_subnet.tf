locals {
  subnets = {
    "external"  = { name = "external", vnet_name = "vnet-fortigate-aa", address_prefixes = [cidrsubnet(module.module_azure_virtual_network["vnet-fortigate-aa"].virtual_network.address_space[0], 8, 0)] }
    "internal"  = { name = "internal", vnet_name = "vnet-fortigate-aa", address_prefixes = [cidrsubnet(module.module_azure_virtual_network["vnet-fortigate-aa"].virtual_network.address_space[0], 8, 1)] }
    "protected" = { name = "protected", vnet_name = "vnet-fortigate-aa", address_prefixes = [cidrsubnet(module.module_azure_virtual_network["vnet-fortigate-aa"].virtual_network.address_space[0], 8, 2)] }
  }
}
module "module_azure_subnet" {
  for_each = local.subnets

  source = "../azure/modules/azure_subnet"

  resource_group_name = module.module_azure_resource_group.resource_group.name
  location            = module.module_azure_resource_group.resource_group.location
  name                = each.value.name
  vnet_name           = module.module_azure_virtual_network[each.value.vnet_name].virtual_network.name
  address_prefixes    = each.value.address_prefixes

}

output "subnets" {
  value = module.module_azure_subnet[*]
}
