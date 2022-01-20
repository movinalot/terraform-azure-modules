locals {
  network_interfaces = {
    "nic-fortigate_a_1" = { name = "nic-fortigate_a_1", enable_ip_forwarding = true, enable_accelerated_networking = true, ip_configuration_name = "ipconfig1", ip_configuration_subnet_id = "external", ip_configuration_private_ip_address_allocation = "Static", ip_configuration_private_ip_address_offset = "5", ip_configuration_public_ip_address_id = "pip-fgt-a-ipsec" }
    "nic-fortigate_a_2" = { name = "nic-fortigate_a_2", enable_ip_forwarding = true, enable_accelerated_networking = true, ip_configuration_name = "ipconfig1", ip_configuration_subnet_id = "internal", ip_configuration_private_ip_address_allocation = "Static", ip_configuration_private_ip_address_offset = "5", ip_configuration_public_ip_address_id = null }
    "nic-fortigate_b_1" = { name = "nic-fortigate_b_1", enable_ip_forwarding = true, enable_accelerated_networking = true, ip_configuration_name = "ipconfig1", ip_configuration_subnet_id = "external", ip_configuration_private_ip_address_allocation = "Static", ip_configuration_private_ip_address_offset = "6", ip_configuration_public_ip_address_id = "pip-fgt-b-ipsec" }
    "nic-fortigate_b_2" = { name = "nic-fortigate_b_2", enable_ip_forwarding = true, enable_accelerated_networking = true, ip_configuration_name = "ipconfig1", ip_configuration_subnet_id = "internal", ip_configuration_private_ip_address_allocation = "Static", ip_configuration_private_ip_address_offset = "6", ip_configuration_public_ip_address_id = null }

  }
}

module "module_azure_network_interface" {
  for_each = local.network_interfaces

  source = "../azure/modules/azure_network_interface"

  resource_group_name           = module.module_azure_resource_group.resource_group.name
  location                      = module.module_azure_resource_group.resource_group.location
  name                          = each.value.name
  enable_ip_forwarding          = each.value.enable_ip_forwarding
  enable_accelerated_networking = each.value.enable_accelerated_networking

  ip_configuration_name                          = each.value.ip_configuration_name
  ip_configuration_subnet_id                     = module.module_azure_subnet[each.value.ip_configuration_subnet_id].subnet.id
  ip_configuration_private_ip_address_allocation = each.value.ip_configuration_private_ip_address_allocation
  ip_configuration_private_ip_address            = cidrhost(module.module_azure_subnet[each.value.ip_configuration_subnet_id].subnet.address_prefixes[0], each.value.ip_configuration_private_ip_address_offset)
  ip_configuration_public_ip_address_id          = each.value.ip_configuration_public_ip_address_id == null ? null : module.module_azure_public_ip[each.value.ip_configuration_public_ip_address_id].public_ip.id
}

output "network_interfaces" {
  value = module.module_azure_network_interface[*]
}
