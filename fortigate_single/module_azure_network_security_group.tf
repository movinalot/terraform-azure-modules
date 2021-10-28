module "module_azure_network_security_group" {
  for_each = var.network_security_groups

  source = "../azure/modules/azure_network_security_group"

  resource_group_name     = module.module_azure_resource_group.resource_group.name
  resource_group_location = module.module_azure_resource_group.resource_group.location
  name                    = each.value.name

  depends_on = [
    module.module_azure_network_interface
  ]
}

output "network_security_groups" {
  value = module.module_azure_network_security_group[*]
}
