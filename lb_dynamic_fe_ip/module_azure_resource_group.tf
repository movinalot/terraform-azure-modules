module "module_azure_resource_group" {

  source = "../azure/modules/azure_resource_group"

  name     = var.resource_group_name
  location = var.resource_group_location
}