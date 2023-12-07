locals {
  resource_group_name="app-grp"
  location="North Europe"
}
  resource "azurerm_resource_group" "appgrp" {
  name     = local.resource_group_name
  location = local.location  
}

resource "azurerm_storage_account" "appstore555333444" {  
  name                     = "appstore555333444"
  resource_group_name      = "app-grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}

resource "azurerm_storage_container" "data" {
  for_each = toset(["data","files","documents"])
  name                  = each.key
  storage_account_name  = "appstore555333444"
  container_access_type = "blob"
  depends_on = [
    azurerm_storage_account.appstore555333444
  ]
}


