module "Jay-project-Repo-module-rg" {
source = "../../Modules/Azurerm_resource_group"
Jay-project-Repo-rg =var.Jay-project-Repo-rg-module  
}

module "project-Repo-module-vnet" {
    depends_on = [ module.Jay-project-Repo-module-rg ]
    source = "../../Modules/Azurerm_virtual_network"
    Jay-project-Repo-vnet = var.Jay-project-Repo-vnet-module 
}

module "Jay-project-Repo-module-subnet" {
    depends_on = [ module.Jay-project-Repo-module-rg ]
    source = "../../Modules/Azurerm_subnet"
    Jay-project-Repo-subnet = var.Jay-project-Repo-subnet-module
}
module "Jay-project-Repo-public-ip-module" {
    depends_on = [ module.Jay-project-Repo-module-rg ]
    source = "../../Modules/Azurerm_public_IP"
    Jay-project-Repo-public-ip = var.Jay-project-Repo-publicip-module
  
}