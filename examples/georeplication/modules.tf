module "acr" {
  source  = "claranet/acr/azurerm"
  version = "x.x.x"

  client_name           = var.client_name
  environment           = var.environment
  stack                 = var.stack
  location              = module.azure_region.location
  location_short        = module.azure_region.location_short
  resource_group_name   = module.rg.name
  sku                   = "Premium"
  data_endpoint_enabled = true

  logs_destinations_ids = [
    module.logs.storage_account_id,
    module.logs.id
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
  resource_group_name = module.rg.name

  sku         = "Premium"
  name_prefix = "extra"

  logs_destinations_ids = [
    module.logs.storage_account_id,
    module.logs.id
  ]

  georeplication_locations = [
    {
      location                        = "francecentral"
      global_endpoint_routing_enabled = true
      zone_redundancy_enabled         = true
      tags = {
        foo = "bar"
      }
    },
    {
      location                        = "northeurope"
      global_endpoint_routing_enabled = true
      zone_redundancy_enabled         = false
      tags = {
        foo = "bar"
      }
    }
  ]

  extra_tags = {
    foo = "bar"
  }
}
