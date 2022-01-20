variable "resource_group_name" {
  description = "Resource Group name"
}
variable "resource_group_location" {
  description = "Resource Group location"
}
variable "public_ips" {
  description = "Public IPs"
  default     = ""
}

variable "virtual_networks" {
  description = "Virtual Networks"
  default     = ""
}

variable "subnets" {
  description = "Virtual Network Subnets"
  default     = ""
}

variable "route_tables" {
  description = "Route Tables"
  default     = ""
}

variable "routes" {
  description = "Routes"
  default     = ""
}

variable "network_interfaces" {
  description = "Virtual Network Interfaces"
  default     = ""
}

variable "network_security_groups" {
  description = "Virtual Network Security Groups"
  default     = ""
}

variable "network_security_rules" {
  description = "Virtual Network Security Rules"
  default     = ""
}

variable "subnet_route_table_associations" {
  default = ""
}

variable "network_interface_security_group_associations" {
  description = ""
  default     = ""
}

variable "storage_accounts" {
  default = ""
}

variable "virtual_machines" {}

variable "forti_manager_ip" {
  description = "FortiManager IP"
  type        = string
  default     = ""
}
variable "forti_manager_serial" {
  description = "FortiManager Serial Number"
  type        = string
  default     = ""
}
