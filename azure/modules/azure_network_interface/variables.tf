variable "resource_group_name" {
  description = "Azure Resource Group name"
}

variable "resource_group_location" {
  description = "Azure Resource Group location AKA region"
}
variable "name" {
  description = "Azure Network Interface Name"
}

variable "enable_ip_forwarding" {
  description = "Azure Virtual Network Intreface enable_ip_forwarding"
}

variable "enable_accelerated_networking" {
  description = "Azure Azure Virtual Network Intreface enable_accelerated_networking"
}

variable "ip_configuration_name" {} 
variable "ip_configuration_subnet_id" {}
variable "ip_configuration_private_ip_address_allocation" {}
variable "ip_configuration_private_ip_address" {}
variable "ip_configuration_public_ip_address_id" {}
