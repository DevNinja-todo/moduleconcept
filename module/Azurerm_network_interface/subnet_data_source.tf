data "azurerm_subnet" "Jay-project-Repo-subnet" {
    for_each = var.Jay-project-Repo-nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}