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
  description = "Azure Subnets"
}
variable "lbs" {
  description = "Azure Load Balancers"
}
