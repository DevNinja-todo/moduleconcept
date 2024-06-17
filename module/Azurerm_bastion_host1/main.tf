resource "azurerm_bastion_host" "Jay-project-Repo-bastion" {
    for_each = var.Jay-project-Repo-bastion
  name                =each.value.bastion_name
  location            =each.value.location
  resource_group_name =each.value.rg_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.Jay-project-Repo-subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.Jay-project-Repo-public-ip[each.key].id
  }
}