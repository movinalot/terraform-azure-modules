variable "resource_group_name" {
  description = "Azure Resource Group name"
}

variable "name" {
  description = "Azure Route Name"
}

variable "address_prefix" {}       
variable "next_hop_in_ip_address" {}
variable "next_hop_type" {}         
variable "route_table_name" {} 
