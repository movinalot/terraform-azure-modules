module "module_azure_resource_group" {

  source = "../azure/modules/azure_resource_group"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}