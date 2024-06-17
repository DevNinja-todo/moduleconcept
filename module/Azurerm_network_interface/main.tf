resource "azurerm_network_interface" "Jay-project-Repo-nic" {
    for_each = var.Jay-project-Repo-nic
    name   = each.value.nic_name
    resource_group_name = each.value.rg_name
    location = each.value.location
 ip_configuration {
    name = "configuration"
    subnet_id = data.azurerm_subnet.Jay-project-Repo-subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
 }
} 