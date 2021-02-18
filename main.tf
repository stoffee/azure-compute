variable "client_secret" {
}

variable "subscription_id" {
}

variable "client_id" {
}

variable "tenant_id" {
}

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

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