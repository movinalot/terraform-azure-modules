locals {
  account_replication_type = "LRS"
  account_tier             = "Standard"
}

module "module_azurerm_storage_account" {
  for_each = var.users

  source = "../azure/rm/azurerm_storage_account"

  resource_group_name      = module.module_azurerm_resource_group[each.value.name].resource_group.name
  location                 = module.module_azurerm_resource_group[each.value.name].resource_group.location
  name                     = format("setrain%s", random_id.id[each.value.name].hex)
  account_replication_type = local.account_replication_type
  account_tier             = local.account_tier
}


resource "random_id" "id" {
  for_each = var.users

  keepers = {
    resource_group_name = format("%s%s", each.value.name, var.user_common["display_name_ext"])
  }

  byte_length = 8
}

output "storage_accounts" {
  value     = module.module_azurerm_storage_account[*]
  sensitive = true
}