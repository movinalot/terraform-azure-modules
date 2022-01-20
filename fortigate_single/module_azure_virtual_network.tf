locals {
  virtual_networks = {
    "vnet-fortigate" = {
      name          = "vnet-fortigate"
      address_space = ["10.130.0.0/16"]
    }
  }
}

module "module_azure_virtual_network" {
  for_each = local.virtual_networks

  source = "../azure/modules/azure_virtual_network"

  resource_group_name = module.module_azure_resource_group.resource_group.name
  location            = module.module_azure_resource_group.resource_group.location
  name                = each.value.name
  address_space       = each.value.address_space

}

output "virtual_networks" {
  value = module.module_azure_virtual_network[*]
}
