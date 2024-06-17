data "azurerm_storage_account" "Jay-storage" {
    for_each = var.Jay-container
  name                = each.value.storage-name
  resource_group_name = each.value.rg_name
}