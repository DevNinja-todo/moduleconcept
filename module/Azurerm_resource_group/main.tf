resource "azurerm_resource_group" "Jay-project-Repo-Rg" {
    for_each = var.Jay-project-Repo-rg
    name = each.value.rg_name
    location = each.value.location
}