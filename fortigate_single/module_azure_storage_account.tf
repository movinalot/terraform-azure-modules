module "module_azure_storage_account" {
  for_each = var.storage_accounts

  source = "../azure/modules/azure_storage_account"

  resource_group_name      = module.module_azure_resource_group.resource_group.name
  resource_group_location  = module.module_azure_resource_group.resource_group.location
  name                     = format("%s%s", each.value.name, "${random_id.random_id.hex}")
  account_replication_type = each.value.account_replication_type
  account_tier             = each.value.account_tier
}

output "storage_accounts" {
  value     = module.module_azure_storage_account[*]
  sensitive = true
}

resource "random_id" "random_id" {
  keepers = {
    resource_group_name = module.module_azure_resource_group.resource_group.name
  }

  byte_length = 8
}