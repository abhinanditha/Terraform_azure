/*

The following links provide the documentation for the new blocks used
in this terraform configuration file

1.azurerm_storage_container - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container

2.azurerm_storage_blob - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob

*/


terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.8.0"
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

resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "North Europe"
}

resource "azurerm_storage_account" "appstore566565637" {
  name                     = "appstore566565637"
  resource_group_name      = "app-grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
}

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = "appstore566565637"
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "maintf" {
  name                   = "main.tf"
  storage_account_name   = "appstore566565637"
  storage_container_name = "data"
  type                   = "Block"
  source                 = "main.tf"
}