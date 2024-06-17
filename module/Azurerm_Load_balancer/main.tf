resource "azurerm_lb" "Jay-lb" {
    for_each = var.jay-lb
  name                = each.value.lb_name
  location            =each.value.location
  resource_group_name = each.value.rg_name

  frontend_ip_configuration {
    name                 = "jayconfig"
    public_ip_address_id = data.azurerm_public_ip.Jay-project-Repo-public-ip.id
  }
}
resource "azurerm_lb_backend_address_pool" "Jay-backendpool" {
  loadbalancer_id = data.azurerm_lb.Jay-lb[each.key].id
  name            = "jay-bckendpool"
}

resource "azurerm_lb_probe" "jay-lbprob" {
  loadbalancer_id = data.azurerm_lb.Jay-lb[each.key].id
  name            = "jay-hlthprob"
  port            = 22
}

resource "azurerm_lb_rule" "jay-lbrule" {
  loadbalancer_id                = data.azurerm_lb.Jay-lb[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
}