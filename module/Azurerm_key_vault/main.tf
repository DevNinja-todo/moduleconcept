resource "azurerm_key_vault" "Jay-project-Repo-key" {
    for_each = var.Jay-project-Repo-keyvault
  
  name                        = each.value.key_vault_name
  location                    = each.value.location
  resource_group_name         =each.value.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.Jay-project-Repo-keyvault.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.Jay-project-Repo-keyvault.tenant_id
    object_id = data.azurerm_client_config.Jay-project-Repo-keyvault.object_id

    key_permissions = [
      "Get",
    ]
    secret_permissions = [
      "Get",
    ]
    storage_permissions = [
      "Get",
    ]
  }
}