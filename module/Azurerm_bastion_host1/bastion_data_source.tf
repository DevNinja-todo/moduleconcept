data "azurerm_subnet" "Jay-project-Repo-subnet" {
    for_each = var.Jay-project-Repo-bastion
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "Jay-project-Repo-public-ip" {
  for_each = var.Jay-project-Repo-bastion
  name = each.value.publicip_name
  resource_group_name = each.value.rg_name
  
}