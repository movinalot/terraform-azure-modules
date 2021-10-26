resource_group_name     = "single-fortigate"
resource_group_location = "eastus2"

public_ips = {
  "ip-fortigate" = { name = "ip-fortigate", allocation_method = "Static", sku = "Standard" }
}

virtual_networks = {
  "vnet-fortigate" = {
    name = "vnet-fortigate"
    address_space = ["10.130.0.0/16"]
  }
}

subnets = {
    "external"  = { name = "external", vnet_name = "vnet-fortigate", address_prefixes = ["10.130.0.0/24"] }
    "internal"  = { name = "internal", vnet_name = "vnet-fortigate", address_prefixes = ["10.130.1.0/24"] }
    "protected" = { name = "protected", vnet_name = "vnet-fortigate", address_prefixes = ["10.130.2.0/24"] }
}

network_interfaces = {
  "nic-fortigate_1" = { name = "nic-fortigate_1", enable_ip_forwarding = true, enable_accelerated_networking = true, ip_configuration_name = "ipconfig1", ip_configuration_subnet_id = "external", ip_configuration_private_ip_address_allocation = "Static", ip_configuration_private_ip_address_offset = "4", ip_configuration_public_ip_address_id = "ip-fortigate"},
  "nic-fortigate_2" = { name = "nic-fortigate_2", enable_ip_forwarding = true, enable_accelerated_networking = true, ip_configuration_name = "ipconfig1", ip_configuration_subnet_id = "internal", ip_configuration_private_ip_address_allocation = "Static", ip_configuration_private_ip_address_offset = "4", ip_configuration_public_ip_address_id = null},
}

network_security_groups = {
  "nsg-public"  = { name = "nsg-public" },
  "nsg-private" = { name = "nsg-private" }
}

network_security_rules = {
  "nsr-public-ingress"  = {
    name                        = "nsr-public-ingress"
    priority                    = 1001
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    network_security_group_name = "nsg-public"
  },
  "nsr-public-egress"  = {
    name                        = "nsr-public-egress"
    priority                    = 1002
    direction                   = "Outbound"
    access                      = "Allow"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    network_security_group_name = "nsg-public"
  },
  "nsr-private-ingress"  = {
    name                        = "nsr-private-ingress"
    priority                    = 1003
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    network_security_group_name = "nsg-private"
  },
  "nsr-private-egress"  = {
    name                        = "nsr-private-egress"
    priority                    = 1004
    direction                   = "Outbound"
    access                      = "Allow"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    network_security_group_name = "nsg-private"
  }
}
