module "acr" {
  source  = "claranet/acr/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.name
  sku                 = "Standard"

  logs_destinations_ids = [
    module.logs.storage_account_id,
    module.logs.id
  ]

  extra_tags = {
    foo = "bar"
  }
}
