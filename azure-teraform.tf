terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.19.0"
    }
  }
}

provider "azurerm" {
   subscription_id = ""
   client_id = ""
   client_secret = ""
   tenant_id = ""
   features{}
}
resource "azurerm_resource_group" "RG" {
  name     = "myrg"
  location = "West Europe"
}
