resource "azurerm_mysql_flexible_database" "Jay-mysqldatabase" {
    for_each = var.Jay-mysqldatabase
  name                =each.value.mysqldatabase_name
  resource_group_name = each.value.rg_name
  server_name         = data.azurerm_mysql_flexible_server.Jay-mysqlflexi[each.key].id
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}