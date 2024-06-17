data "azurerm_virtual_network" "Jay-project-Repo-vnetpeering-1" {
    for_each = var.Jay-project-Repo-vnetpeering

  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
}

data "azurerm_virtual_network" "Jay-project-Repo-vnetpeering-2" {
    for_each = var.Jay-project-Repo-vnetpeering
  name                = each.value.vnet_name1
  resource_group_name = each.value.rg_name
}

data "azurerm_resource_group" "Jay-project-Repo-Rg" {
    for_each = var.Jay-project-Repo-vnetpeering
  name = each.value.rg_name
}