module "module_azure_virtual_machine" {
  for_each = var.virtual_machines

  source = "../azure/modules/azure_virtual_machine"

  resource_group_location = module.module_azure_resource_group.resource_group.location
  resource_group_name     = module.module_azure_resource_group.resource_group.name
  name                    = each.value.name  
  network_interface_ids   = [for nic in each.value.network_interface_ids : module.module_azure_network_interface[nic].network_interface.id]

  primary_network_interface_id = module.module_azure_network_interface[each.value.primary_network_interface_id].network_interface.id
  vm_size                      = each.value.vm_size

  identity_identity = each.value.identity_identity

  storage_image_reference_publisher = each.value.storage_image_reference_publisher
  storage_image_reference_offer     = each.value.storage_image_reference_offer
  storage_image_reference_sku       = each.value.storage_image_reference_sku
  storage_image_reference_version   = each.value.storage_image_reference_version

  plan_name      = each.value.plan_name
  plan_publisher = each.value.plan_publisher
  plan_product   = each.value.plan_product

  os_profile_computer_name = each.value.name 
  os_profile_admin_username = each.value.os_profile_admin_username
  os_profile_admin_password = each.value.os_profile_admin_password
  os_profile_custom_data = data.template_file.fgtvm.rendered
  

  # storage_os_disk_name              = "osDisk"
  # storage_os_disk_caching           = "ReadWrite"
  # storage_os_disk_managed_disk_type = "Premium_LRS"
  # storage_os_disk_create_option     = "FromImage"

  # storage_data_disk_name              = "fgtvmdatadisk"
  # storage_data_disk_managed_disk_type = "Premium_LRS"
  # storage_data_disk_create_option     = "Empty"
  # storage_data_disk_lun               = 0
  # storage_data_disk_disk_size_gb      = "30"

  os_profile_linux_config_disable_password_authentication = each.value.os_profile_linux_config_disable_password_authentication

  boot_diagnostics_enabled     = each.value.boot_diagnostics_enabled
  boot_diagnostics_storage_uri = module.module_azure_storage_account["st-diag"].storage_account.primary_blob_endpoint

  depends_on = [
    module.module_azure_virtual_network
  ]
}

output "virtual_machines" {
  value = module.module_azure_virtual_machine[*]
  sensitive = true
}

resource "random_string" "random_apikey" {
  length  = 30
  special = false
}

data "template_file" "fgtvm" {
  template = file("fgtvm.conf")
  vars = {
    type          = "flexvm"
    license_file  = ""
    license_token = "1089D7922C4946E8B611"
    api_key       = random_string.random_apikey.id
  }
}