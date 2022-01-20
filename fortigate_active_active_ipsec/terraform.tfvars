resource_group_name     = "jmcdonough-fortigate-active-active-ipsec"
resource_group_location = "eastus2"

network_security_groups = {
  "nsg-public"  = { name = "nsg-public" }
  "nsg-private" = { name = "nsg-private" }
}

network_security_rules = {
  "nsr-public-ingress" = {
    name                        = "nsr-public-ingress"
    priority                    = 1001
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    network_security_group_name = "nsg-public"
  },
  "nsr-public-egress" = {
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
  "nsr-private-ingress" = {
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
  "nsr-private-egress" = {
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

network_interface_security_group_associations = {
  "nic-fortigate_1-nsg-public" = {
    network_interface_id      = "nic-fortigate_1"
    network_security_group_id = "nsg-public"
  },
  "nic-fortigate_2-nsg-public" = {
    network_interface_id      = "nic-fortigate_2"
    network_security_group_id = "nsg-private"
  },

}

virtual_machines = {
  "vm-fgt" = {
    "name"              = "vm-fgt",
    "config_template"   = "fgtvm.conf",
    "identity_identity" = "SystemAssigned",

    "network_interface_ids"        = ["nic-fortigate_1", "nic-fortigate_2"],
    "primary_network_interface_id" = "nic-fortigate_1",

    "vm_size" = "Standard_F4s"

    connect_to_fmg = ""
    license_type   = ""
    license_file   = ""
    serial_number  = ""
    license_token  = ""

    "storage_image_reference_publisher" = "fortinet"
    "storage_image_reference_offer"     = "fortinet_fortigate-vm_v5"
    "storage_image_reference_sku"       = "fortinet_fg-vm"
    "storage_image_reference_version"   = "7.0.1"

    "plan_name"                 = "fortinet_fg-vm"
    "plan_publisher"            = "fortinet"
    "plan_product"              = "fortinet_fortigate-vm_v5"
    "os_profile_admin_username" = "azureuser"
    "os_profile_admin_password" = "Password123!!"

    "os_profile_linux_config_disable_password_authentication" = false
    "boot_diagnostics_enabled"                                = true

    storage_os_disk_name              = "osDisk"
    storage_os_disk_caching           = "ReadWrite"
    storage_os_disk_managed_disk_type = "Premium_LRS"
    storage_os_disk_create_option     = "FromImage"

    storage_data_disk_name              = "fgtvmdatadisk"
    storage_data_disk_managed_disk_type = "Premium_LRS"
    storage_data_disk_create_option     = "Empty"
    storage_data_disk_disk_size_gb      = "30"
    storage_data_disk_lun               = "0"
  }
}

