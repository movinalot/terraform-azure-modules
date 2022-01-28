data "azuread_group" "group" {
  display_name     = var.user_common["group_display_name"]
  security_enabled = var.user_common["group_security_enabled"]
}

module "module_azuread_group_member" {
  for_each = var.users

  source = "../azure/ad/azuread_group_member"

  group_object_id  = data.azuread_group.group.id
  member_object_id = module.module_azuread_user[each.value.name].user.id
}

output "group_members" {
  value = module.module_azuread_group_member[*]
}
