module "module_azure_network_interface" {
  for_each = var.network_interfaces

  source = "../azure/modules/azure_network_interface"

  resource_group_name           = module.module_azure_resource_group.resource_group.name
  resource_group_location       = module.module_azure_resource_group.resource_group.location
  name                          = each.value.name
  enable_ip_forwarding          = each.value.enable_ip_forwarding
  enable_accelerated_networking = each.value.enable_accelerated_networking

  ip_configuration_name                          = each.value.ip_configuration_name
  ip_configuration_subnet_id                     = module.module_azure_subnet[each.value.ip_configuration_subnet_id].subnet.id
  ip_configuration_private_ip_address_allocation = each.value.ip_configuration_private_ip_address_allocation
  #ip_configuration_private_ip_address            = each.value.ip_configuration_private_ip_address
  ip_configuration_private_ip_address            = cidrhost(module.module_azure_subnet[each.value.ip_configuration_subnet_id].subnet.address_prefixes[0], each.value.ip_configuration_private_ip_address_offset)
  ip_configuration_public_ip_address_id          = each.value.ip_configuration_public_ip_address_id == null ? null : module.module_azure_public_ip[each.value.ip_configuration_public_ip_address_id].public_ip.id

  depends_on = [
    module.module_azure_subnet
  ]
}

output "network_interfaces" {
  value = module.module_azure_network_interface[*]
}
