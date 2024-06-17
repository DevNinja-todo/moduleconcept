data "azurerm_mysql_flexible_server" "Jay-mysqlflexi" {
    for_each = var.Jay-mysqldatabase
  name                = each.value.mysqlflexi_server_name
  resource_group_name = each.value.rg_name
}


