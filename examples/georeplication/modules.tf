module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "run-common" {
  source  = "claranet/run-common/azurerm"
  version = "x.x.x"

  client_name    = var.client_name
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  environment    = var.environment

  stack               = var.stack
  resource_group_name = module.rg.resource_group_name

  tenant_id = var.azure_tenant_id



}

module "acr" {
  source  = "claranet/acr/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name
  sku                 = "Premium"

  logs_destinations_ids = [
    module.run-common.logs_storage_account_id,
    module.run-common.log_analytics_workspace_id
  ]

  georeplication_locations = [
    {
      location                = "francecentral"
      zone_redundancy_enabled = true
      tags = {
        foo = "bar"
      }
    },
    {
      location                = "northeurope"
      zone_redundancy_enabled = false
      tags = {
        foo = "bar"
      }
    }
  ]

  extra_tags = {
    foo = "bar"
  }

}
