terraform {
    required_version = ">=1.6.0"
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.50.0"
        }
    }
}

provider "azurerm" {
    features {}
    subscription_id = "1d07c16c-0b0c-4cc5-804f-b8d22db2f4d3"
}
