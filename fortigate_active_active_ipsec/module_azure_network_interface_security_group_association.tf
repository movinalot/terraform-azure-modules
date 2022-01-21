locals {
  network_interface_security_group_associations = {
    "nic-fortigate_a_1" = {
      network_interface_id      = "nic-fortigate_a_1"
      network_security_group_id = "nsg-public"
    },
    "nic-fortigate_a_2" = {
      network_interface_id      = "nic-fortigate_a_2"
      network_security_group_id = "nsg-private"
    },
    "nic-fortigate_b_1" = {
      network_interface_id      = "nic-fortigate_b_1"
      network_security_group_id = "nsg-public"
    },
    "nic-fortigate_b_2" = {
      network_interface_id      = "nic-fortigate_b_2"
      network_security_group_id = "nsg-private"
    }
  }
}

module "module_azure_network_interface_security_group_association" {
  for_each = local.network_interface_security_group_associations

  source = "../azure/modules/azure_network_interface_security_group_association"

  network_interface_id      = module.module_azure_network_interface[each.value.network_interface_id].network_interface.id
  network_security_group_id = module.module_azure_network_security_group[each.value.network_security_group_id].network_security_group.id
}

output "network_interface_security_group_associations" {
  value = module.module_azure_network_interface_security_group_association[*]
}
