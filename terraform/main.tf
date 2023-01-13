terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
        resource_group_name  = "cloud-shell-storage-centralindia"
        storage_account_name = "csg100320009c814a38"
        container_name       = "blob"
        key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}


