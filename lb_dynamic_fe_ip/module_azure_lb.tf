module "module_azure_lb" {
  for_each = var.lbs

  source = "../azure/modules/azure_lb"

  resource_group_name        = var.resource_group_name
  resource_group_location    = var.resource_group_location
  name                       = each.value.name
  sku                        = each.value.sku
  frontend_ip_configurations = each.value.frontend_ip_configurations
  public_ips                 = module.module_azure_public_ip
  subnets                    = module.module_azure_subnet
}

output "lbs" {
  value = module.module_azure_lb[*]
}