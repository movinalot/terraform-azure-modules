resource_group_name     = "lb_dynamic_fe_ip"
resource_group_location = "eastus2"

public_ips = {
  "pub_ip_1" = { name = "pub_ip_1", allocation_method = "Static", sku = "Standard" }
  "pub_ip_2" = { name = "pub_ip_2", allocation_method = "Static", sku = "Standard" }
  "pub_ip_3" = { name = "pub_ip_3", allocation_method = "Static", sku = "Standard" }
}

virtual_networks = {
  "vnet_1" = {
    name = "vnet_1"
    address_space = ["10.125.0.0/16"]
  }
}

subnets = {
      "subnet_0" = { name = "subnet_0", vnet_name = "vnet_1", address_prefixes = ["10.125.0.0/24"] }
      "subnet_1" = { name = "subnet_1", vnet_name = "vnet_1", address_prefixes = ["10.125.1.0/24"] }
      "subnet_2" = { name = "subnet_2", vnet_name = "vnet_1", address_prefixes = ["10.125.2.0/24"] }
      "subnet_3" = { name = "subnet_3", vnet_name = "vnet_1", address_prefixes = ["10.125.3.0/24"] }
}

lbs = {
  "external_lb_1" = {
    name                = "external_lb_1"
    sku                 = "standard"
    resource_group_name = "jmcdonough_azure_lb_dynamic_fe_ip"
    location            = "eastus2"
    frontend_ip_configurations = [
      {
        name                 = "external_lb_1_fe_ip_1"
        public_ip_address_id = "pub_ip_1"
        type                 = "public"
      },
      {
        name                 = "external_lb_1_fe_ip_2"
        public_ip_address_id = "pub_ip_2"
        type                 = "public"
      }
    ]
  },
  "external_lb_2" = {
    name                = "external_lb_2"
    sku                 = "standard"
    resource_group_name = "jmcdonough_azure_lb_dynamic_fe_ip"
    location            = "eastus2"
    frontend_ip_configurations = [
      {
        name                 = "external_lb_2_fe_ip_1"
        public_ip_address_id = "pub_ip_3"
        type                 = "public"
      }
    ]
  },
    "internal_lb_1" = {
    name                = "internal_lb_1"
    sku                 = "standard"
    resource_group_name = "jmcdonough_azure_lb_dynamic_fe_ip"
    location            = "eastus2"
    frontend_ip_configurations = [
      {
        name                          = "internal_lb_1_fe_ip_1"
        subnet_id                     = "subnet_0"
        vnet_name                     = "vnet_1"
        private_ip_address            = "10.125.0.5"
        private_ip_address_allocation = "Static"
        private_ip_address_version    = "IPv4"
        type                          = "private"
      }
    ]
  }
}
