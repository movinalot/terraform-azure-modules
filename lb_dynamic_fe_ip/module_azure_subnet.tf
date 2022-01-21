locals {
  subnets = {
    "subnet_0" = { name = "subnet_0", vnet_name = "vnet_1", address_prefixes = [cidrsubnet(module.module_azure_virtual_network["vnet_1"].virtual_network.address_space[0], 8, 0)] }
    "subnet_1" = { name = "subnet_1", vnet_name = "vnet_1", address_prefixes = [cidrsubnet(module.module_azure_virtual_network["vnet_1"].virtual_network.address_space[0], 8, 1)] }
    "subnet_2" = { name = "subnet_2", vnet_name = "vnet_1", address_prefixes = [cidrsubnet(module.module_azure_virtual_network["vnet_1"].virtual_network.address_space[0], 8, 2)] }
    "subnet_3" = { name = "subnet_3", vnet_name = "vnet_1", address_prefixes = [cidrsubnet(module.module_azure_virtual_network["vnet_1"].virtual_network.address_space[0], 8, 3)] }
  }
}

module "module_azure_subnet" {
  for_each = local.subnets

  source = "../azure/modules/azure_subnet"

  resource_group_name = module.module_azure_resource_group.resource_group.name
  name                = each.value.name
  vnet_name           = each.value.vnet_name
  address_prefixes    = each.value.address_prefixes

}

output "subnets" {
  value = module.module_azure_subnet[*]
}
