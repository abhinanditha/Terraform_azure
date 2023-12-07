terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "84b59ae2-aea4-4beb-9c05-8aec97896af8"
  client_id       = "40357bea-040e-429a-a5da-2ec508891caf"
  client_secret   = "yE-8Q~X-YfeP~NNPQ-5.PDFsBLebn.qAKeNx0bWX"
  tenant_id       = "5137e94b-7618-4b09-a14a-a46d450d584d"
  features {}
}

locals {
  resource_group_name="app-grp"
  location="North Europe"
}

resource "azurerm_resource_group" "appgrp" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_virtual_network" "appnetwork" {
  name                = "app-network"
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnetA"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name           = "subnetB"
    address_prefix = "10.0.1.0/24"    
  }
}

