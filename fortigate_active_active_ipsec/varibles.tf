variable "resource_group_name" {
  description = "Azure Resource Group name"
}
variable "resource_group_location" {
  description = "Azure Resource Group location AKA region"
}
variable "public_ips" {
  description = "Azure Public IPs"
}

variable "virtual_networks" {
  description = "Azure Virtual Networks"
}

variable "subnets" {
  description = "Azure Virtual Network Subnets"
}

variable "route_tables" {
  description = "Azure Route Tables"
}
variable "routes" {
  description = "Azure Routes"
}

variable "network_interfaces" {
  description = "Azure Virtual Network Interfaces"
}

variable "network_security_groups" {
  description = "Azure Virtual Network Security Groups"
}

variable "network_security_rules" {
  description = "Azure Virtual Network Security Rules"
}

variable "subnet_route_table_associations" {}

variable "network_interface_security_group_associations" {}

variable "storage_accounts" {}

variable "virtual_machines" {}

variable "forti_manager_ip" {}
variable "forti_manager_serial" {}
#variable "flexvm_config" {}
#variable "flexvm_program" {}
#variable "flexvm_api_user" {}
#variable "flexvm_api_pass" {}
#variable "flexvm_op" {}

#variable "license_token" {}
#variable "license_type" {}
#variable "serial_number" {}
#variable "license_file" {}
#variable "connect_to_fmg" {}