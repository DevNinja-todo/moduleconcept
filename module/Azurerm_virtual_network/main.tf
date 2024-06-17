resource "azurerm_virtual_network" "Jay-project-Repo-vnet" {
    for_each = var.Jay-project-Repo-vnet
    name  = each.value.vnet_name
    location = each.value.location
    resource_group_name = each.value.rg_name
    address_space = each.value.address_space
  
}