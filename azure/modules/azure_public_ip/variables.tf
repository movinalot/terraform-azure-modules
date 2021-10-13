variable "resource_group_name" {
  description = "Azure Resource Group name"
}
variable "resource_group_location" {
  description = "Azure Resource Group location AKA region"
}

variable "name" {
  description = "Public IP Name"
}

variable "sku" {
  description = "Public IP SKU"
}

variable "allocation_method" {
  description = "Public IP allocation_method"
}
