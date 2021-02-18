module "resource-group" {
  source  = "rink72/resource-group/azurerm"
  version = "1.0.0"
  location = "westus2"
  name = "MyName"
}

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "2.3.0"
  resource_group_name = "MyName"
}

module "compute" {
  source  = "Azure/compute/azurerm"
  version = "3.11.0"
  license_type = "Windows_Server"
  resource_group_name = "MyName"
  vnet_subnet_id = module.vnet.vnet_subnets
}