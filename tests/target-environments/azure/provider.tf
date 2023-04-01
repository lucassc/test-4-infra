terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }


  backend "azurerm" {
    key      = "test-target.tfstate"
    use_oidc = true
  }
}

provider "azurerm" {
  use_oidc = true
  features {}
}
