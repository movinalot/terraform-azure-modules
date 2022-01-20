locals {
  public_ips = {
    "pip-fgt" = { name = "pip-fgt", allocation_method = "Static", sku = "Standard" }
  }
}

module "module_azure_public_ip" {
  for_each = local.public_ips

  source = "../azure/modules/azure_public_ip"

  resource_group_name = module.module_azure_resource_group.resource_group.name
  location            = module.module_azure_resource_group.resource_group.location
  name                = each.value.name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku

}

output "public_ips" {
  value = module.module_azure_public_ip[*]
}