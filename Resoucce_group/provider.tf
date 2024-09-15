terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.2.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  }

  resource "azurerm_resource_group" "example1" {
  name     = "example1"
  location = "West Europe"
}

resource "azurerm_resource_group" "example2" {
  name     = "example2"
  location = "West Europe"
}