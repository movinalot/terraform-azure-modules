locals {
  network_security_groups = {
    "nsg-public"  = { name = "nsg-public" }
    "nsg-private" = { name = "nsg-private" }
  }
}

module "module_azure_network_security_group" {
  for_each = local.network_security_groups

  source = "../azure/modules/azure_network_security_group"

  resource_group_name = module.module_azure_resource_group.resource_group.name
  location            = module.module_azure_resource_group.resource_group.location
  name                = each.value.name

  depends_on = [
    module.module_azure_network_interface
  ]
}

output "network_security_groups" {
  value = module.module_azure_network_security_group[*]
}
