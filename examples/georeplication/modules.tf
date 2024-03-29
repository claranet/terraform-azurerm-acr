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

module "logs" {
  source  = "claranet/run/azurerm//modules/logs"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name
}

module "acr" {
  source  = "claranet/acr/azurerm"
  version = "x.x.x"

  client_name           = var.client_name
  environment           = var.environment
  stack                 = var.stack
  location              = module.azure_region.location
  location_short        = module.azure_region.location_short
  resource_group_name   = module.rg.resource_group_name
  sku                   = "Premium"
  data_endpoint_enabled = true

  logs_destinations_ids = [
    module.logs.logs_storage_account_id,
    module.logs.log_analytics_workspace_id
  ]

  georeplication_locations = [
    "francecentral",
    "northeurope",
    "westeurope",
  ]

  extra_tags = {
    foo = "bar"
  }

}

module "acr_extra" {
  source  = "claranet/acr/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name

  sku         = "Premium"
  name_prefix = "extra"

  logs_destinations_ids = [
    module.logs.logs_storage_account_id,
    module.logs.log_analytics_workspace_id
  ]

  georeplication_locations = [
    {
      location                  = "francecentral"
      zone_redundancy_enabled   = true
      regional_endpoint_enabled = true
      tags = {
        foo = "bar"
      }
    },
    {
      location                  = "northeurope"
      zone_redundancy_enabled   = false
      regional_endpoint_enabled = true
      tags = {
        foo = "bar"
      }
    }
  ]

  extra_tags = {
    foo = "bar"
  }
}
