resource "azurerm_storage_container" "Jay-container" {
 
    for_each = var.Jay-container
  name                  = each.value.container_name 
  storage_account_name  = data.azurerm_storage_account.Jay-storage[each.key].name
  container_access_type = "private"
}