variable "resource_group_name" {
  description = "Azure Resource Group name"
}

variable "name" {
  description = "Azure Network Security Rule"
}

variable "priority" {}
variable "direction" {}
variable "access" {}
variable "protocol" {}
variable "source_port_range" {}
variable "destination_port_range" {}
variable "source_address_prefix" {}
variable "destination_address_prefix" {}
variable "network_security_group_name" {}
