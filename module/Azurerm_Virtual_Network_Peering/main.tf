resource "azurerm_virtual_network_peering" "Jay-project-Repo-vnetpeering-1" {
    for_each = var.Jay-project-Repo-vnetpeering
  name                      = each.value.vnetpeering_name
  resource_group_name       = data.azurerm_resource_group.Jay-project-Repo-Rg[each.key].name
  virtual_network_name      = data.azurerm_virtual_network.Jay-project-Repo-vnetpeering-1[each.key].name
  remote_virtual_network_id = data.azurerm_virtual_network.Jay-project-Repo-vnetpeering-2[each.key].id
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
}

resource "azurerm_virtual_network_peering" "Jay-project-Repo-vnetpeering-2" {
    for_each = var.Jay-project-Repo-vnetpeering
  name                      = each.value.vnetpeering_name1
  resource_group_name       = data.azurerm_resource_group.Jay-project-Repo-Rg[each.key].name
  virtual_network_name      = data.azurerm_virtual_network.Jay-project-Repo-vnetpeering-2[each.key].name
  remote_virtual_network_id = data.azurerm_virtual_network.Jay-project-Repo-vnetpeering-1[each.key].id
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
}