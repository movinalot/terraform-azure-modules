variable "resource_group_name" {
  description = "Resource Group name"
}

variable "location" {
  description = "Resource Group location"
}

variable "name" {
  description = "Network Interface Name"
}

variable "enable_ip_forwarding" {
  description = "Virtual Network Interface enable_ip_forwarding"
}

variable "enable_accelerated_networking" {
  description = "Virtual Network Interface enable_accelerated_networking"
}

variable "ip_configuration_name" {
  description = "Virtual Network Interface ip_configuration_name"
}

variable "ip_configuration_subnet_id" {
  description = "Virtual Network Interface ip_configuration_subnet_id"
}

variable "ip_configuration_private_ip_address_allocation" {
  description = "Virtual Network Interface ip_configuration_private_ip_address_allocation"
}

variable "ip_configuration_private_ip_address" {
  description = "Virtual Network Interface ip_configuration_private_ip_address"
}

variable "ip_configuration_public_ip_address_id" {
  description = "Virtual Network Interface ip_configuration_public_ip_address_id"
}
