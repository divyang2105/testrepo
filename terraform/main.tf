terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
        resource_group_name  = "cloud-shell-storage-centralindia"
        storage_account_name = "csg100320024b58200e"
        container_name       = "tfstatefiles"
        key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}


