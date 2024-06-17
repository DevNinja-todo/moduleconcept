resource "azurerm_mysql_flexible_server" "Jay-mysqlflexi" {
    for_each = var.Jay-mysqlflexi_server
  name                   = each.value.mysqlflexi_server_name
  resource_group_name    = each.value.rg_name
  location               = each.value.location
  administrator_login    = data.azurerm_key_vault_secret.jay-username[each.key].value
  administrator_password = data.azurerm_key_vault_secret.jay-password[each.key].value
  backup_retention_days  = 7
  sku_name               = "GP_Standard_D2ds_v4"
}