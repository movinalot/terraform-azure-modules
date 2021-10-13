variable "resource_group_name" {
  description = "Azure Resource Group name"
}

variable "resource_group_location" {
  description = "Azure Resource Group location AKA region"
}

variable "name" {
  description = "Azure Subnet Name"
}

variable "vnet_name" {
  description = "Azure Virtual Network Name"
}

variable "address_prefixes" {
  description = "Azure Subnet Address Space"
}
