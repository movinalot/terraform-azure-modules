variable "resource_group_name" {
  description = "Azure Resource Group name"
}
variable "resource_group_location" {
  description = "Azure Resource Group location AKA region"
}

variable "name" {
  description = "Load Balancer Name"
}

variable "sku" {
  description = "Load Balancer SKU"
}

variable "frontend_ip_configurations" {
  description = "Azure Load Balancer Frontend IP Configurations"
}

variable "public_ips" {
  description = "Azure Public IPs"
}

variable "subnets" {
  description = "Azure Virtual Network Subnets"
}