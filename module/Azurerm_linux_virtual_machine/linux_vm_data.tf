data "azurerm_network_interface" "Jay-project-Repo-nic" {
    for_each = var.Jay-linux-virtual_machine
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "Jay-project-Repo-key" {
 for_each = var.Jay-linux-virtual_machine
  name                = each.value.key_vault_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "jayusername" {
    for_each = var.Jay-linux-virtual_machine
  name         =each.value.secret_name
  key_vault_id = data.azurerm_key_vault.Jay-project-Repo-key[each.key].id
}

data "azurerm_key_vault_secret" "jayuserpassword" {
    for_each = var.Jay-linux-virtual_machine
  name         = each.value.secret_password
  key_vault_id = data.azurerm_key_vault.Jay-project-Repo-key[each.key].id
}

