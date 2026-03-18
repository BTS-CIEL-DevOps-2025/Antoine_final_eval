terraform {
  required_version = ">= 1.8.2"

  required_providers {
    azurerm = {
      version = ">= 4"
      source  = "hashicorp/azurerm"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

  }

  backend "azurerm" {
    tenant_id            = "18057b23-dbd3-4057-9f2f-58efbd9345a8"
    subscription_id      = "f6f9cbca-a3b0-420f-9354-c55f2d575fca"
    resource_group_name  = "resources_partagees"
    storage_account_name = "btsciel2finaleval"
    container_name       = "Antoine"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id                 = "f6f9cbca-a3b0-420f-9354-c55f2d575fca"
  resource_provider_registrations = "none"
  features {
    # All the features you require for your deployment. See provider documentation
  }
}