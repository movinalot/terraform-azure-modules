module "module_azure_network_interface_security_group_association" {
  for_each = var.network_interface_security_group_associations

  source = "../azure/modules/azure_network_interface_security_group_association"

  network_interface_id      = module.module_azure_network_interface[each.value.network_interface_id].network_interface.id
  network_security_group_id = module.module_azure_network_security_group[each.value.network_security_group_id].network_security_group.id
}

output "network_interface_security_group_associations" {
  value = module.module_azure_network_interface_security_group_association[*]
}
