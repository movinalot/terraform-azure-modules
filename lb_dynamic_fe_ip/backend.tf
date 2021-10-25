terraform {
  backend "azurerm" {
    resource_group_name  = "jmcdonough-utility"
    storage_account_name = "jmcdonoughutility"
    container_name       = "terraform"
    key                  = "terraform-lb-dynamic-fe-ip.terraform.tfstate"
  }
}