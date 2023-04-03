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
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
