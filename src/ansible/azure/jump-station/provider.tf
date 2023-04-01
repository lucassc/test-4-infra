terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }


  backend "azurerm" {
    key      = "test-4-infra-jump-station.tfstate"
    use_oidc = true
  }
}

provider "azurerm" {
  use_oidc = true
  features {}
}
