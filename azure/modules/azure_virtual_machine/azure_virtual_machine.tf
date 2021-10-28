resource "azurerm_virtual_machine" "virtual_machine" {

  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  name                = var.name

  network_interface_ids        = var.network_interface_ids
  primary_network_interface_id = var.primary_network_interface_id
  vm_size                      = var.vm_size

  identity {
    type = var.identity_identity
  }

  storage_image_reference {
    publisher = var.storage_image_reference_publisher
    offer     = var.storage_image_reference_offer
    sku       = var.storage_image_reference_sku
    version   = var.storage_image_reference_version
  }

  plan {
    name      = var.plan_name
    publisher = var.plan_publisher
    product   = var.plan_product
  }

  storage_os_disk {
    name              = "osDisk"
    caching           = "ReadWrite"
    managed_disk_type = "Premium_LRS"
    create_option     = "FromImage"
  }

  # Log data disks
  storage_data_disk {
    name              = "fgtvmdatadisk"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "30"
  }

  os_profile {
    computer_name  = var.os_profile_computer_name
    admin_username = var.os_profile_admin_username
    admin_password = var.os_profile_admin_password
    custom_data    = var.os_profile_custom_data
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = var.boot_diagnostics_storage_uri
  }
}  


output "virtual_machine" {
  value = azurerm_virtual_machine.virtual_machine
}