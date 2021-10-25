resource "azurerm_lb" "lb" {

  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  name                = var.name
  sku                 = var.sku

  dynamic "frontend_ip_configuration" {
    for_each = [
      for fe_ip in var.frontend_ip_configurations : fe_ip
      if fe_ip.type == "public"
    ]
    content {
      name                          = frontend_ip_configuration.value.name
      public_ip_address_id          = var.public_ips[frontend_ip_configuration.value.public_ip_address_id].public_ip.id
    }
  }
  dynamic "frontend_ip_configuration" {
    for_each = [
      for fe_ip in var.frontend_ip_configurations : fe_ip
      if fe_ip.type == "private"
    ]
    content {
      name                          = frontend_ip_configuration.value.name
      subnet_id                     = var.subnets[frontend_ip_configuration.value.subnet_id].subnet.id
      private_ip_address            = frontend_ip_configuration.value.private_ip_address
      private_ip_address_allocation = frontend_ip_configuration.value.private_ip_address_allocation
      private_ip_address_version    = frontend_ip_configuration.value.private_ip_address_version
    }
  }
}

output "lb" {
  value = azurerm_lb.lb
}