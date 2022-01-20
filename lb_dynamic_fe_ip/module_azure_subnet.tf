locals {
  subnets = {
    "subnet_0" = { name = "subnet_0", vnet_name = "vnet_1", address_prefixes = ["10.125.0.0/24"] }
    "subnet_1" = { name = "subnet_1", vnet_name = "vnet_1", address_prefixes = ["10.125.1.0/24"] }
    "subnet_2" = { name = "subnet_2", vnet_name = "vnet_1", address_prefixes = ["10.125.2.0/24"] }
    "subnet_3" = { name = "subnet_3", vnet_name = "vnet_1", address_prefixes = ["10.125.3.0/24"] }
  }
}

module "module_azure_subnet" {
  for_each = local.subnets

  source = "../azure/modules/azure_subnet"

  resource_group_name = module.module_azure_resource_group.resource_group.name
  location            = module.module_azure_resource_group.resource_group.location
  name                = each.value.name
  vnet_name           = each.value.vnet_name
  address_prefixes    = each.value.address_prefixes

  depends_on = [
    module.module_azure_virtual_network
  ]
}

output "subnets" {
  value = module.module_azure_subnet[*]
}
