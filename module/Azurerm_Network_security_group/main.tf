resource "azurerm_network_security_group" "Jay-nsg" {
    for_each = var.Jay-nsg
  name                =each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  security_rule {
    name                       = "jay-nsgrule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}