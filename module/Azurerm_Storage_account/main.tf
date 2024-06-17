resource "azurerm_storage_account" "Jay-storage" {
    for_each = var.Jay-storage
  name                     = each.value.storage-name
  resource_group_name      = each.value.rg_name
  location                 =each.value.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
