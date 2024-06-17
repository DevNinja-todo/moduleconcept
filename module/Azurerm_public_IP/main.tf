resource "azurerm_public_ip" "Jay-project-Repo-public-ip" {
    for_each = var.Jay-project-Repo-public-ip
    name = each.value.publicip_name
    resource_group_name = each.value.rg_name
    location = each.value.location
    sku = "Standard"
    allocation_method ="Static" 
}