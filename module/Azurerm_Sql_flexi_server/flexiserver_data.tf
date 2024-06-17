data "azurerm_key_vault" "Jay-project-Repo-key" {
 for_each = var.Jay-mysqlflexi_server
  name                = each.value.key_vault_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "jay-username" {
    for_each = var.Jay-mysqlflexi_server
  name         =each.value.secret_name
  key_vault_id = data.azurerm_key_vault.Jay-project-Repo-key[each.key].id
}

data "azurerm_key_vault_secret" "jay-password" {
    for_each = var.Jay-mysqlflexi_server
  name         = each.value.secret_password
  key_vault_id = data.azurerm_key_vault.Jay-project-Repo-key[each.key].id
}