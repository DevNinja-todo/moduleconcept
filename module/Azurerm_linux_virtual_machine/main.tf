resource "azurerm_linux_virtual_machine" "Jay-linux-vm" {
    for_each = var.Jay-linux-virtual_machine
  name                =each.value.linux_vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = data.azurerm_key_vault_secret.jayusername[each.key].value
  admin_password      = data.azurerm_key_vault_secret.jayuserpassword[each.key].value
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.Jay-project-Repo-nic[each.key].id,
  ]

  os_disk {
    caching              =  each.value.caching_name 
    storage_account_type = each.value.storage_account_type_name 
  }

  source_image_reference {
    publisher = each.value.publisher_name 
    offer     = each.value.offer_name 
    sku       = each.value.sku_name 
    version   = each.value.version_name 
  }
}