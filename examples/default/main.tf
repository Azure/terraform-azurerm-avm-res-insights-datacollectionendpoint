terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 2.4"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "azapi" {}

resource "random_pet" "name" {
  length = 2
}

# Create a resource group
resource "azapi_resource" "resource_group" {
  location               = "eastus"
  name                   = "rg-${random_pet.name.id}"
  type                   = "Microsoft.Resources/resourceGroups@2024-03-01"
  body                   = {}
  response_export_values = []
}

# This is the module call
module "datacollectionendpoint" {
  source = "../../"

  location              = azapi_resource.resource_group.location
  name                  = "dce-${random_pet.name.id}"
  parent_id             = azapi_resource.resource_group.id
  enable_telemetry      = var.enable_telemetry
  kind                  = "Windows"
  public_network_access = "Disabled"
  tags = {
    environment = "test"
  }
}
