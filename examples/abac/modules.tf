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

  # Repository-scoped ABAC roles (`Container Registry Repository *`) instead of registry-wide RBAC roles (`AcrPull`/`AcrPush`)
  role_assignment_mode = "AbacRepositoryPermissions"

  logs_destinations_ids = [
    module.logs.storage_account_id,
    module.logs.id
  ]

  extra_tags = {
    foo = "bar"
  }
}

# Repository-scoped pull permission (ABAC condition on the repository name)
resource "azurerm_role_assignment" "repo_reader" {
  scope                            = module.acr.id
  role_definition_name             = "Container Registry Repository Reader"
  principal_id                     = azurerm_user_assigned_identity.example.principal_id
  principal_type                   = "ServicePrincipal"
  skip_service_principal_aad_check = true

  condition_version = "2.0"
  condition         = <<-EOT
(
 (
  !(ActionMatches{'Microsoft.ContainerRegistry/registries/repositories/content/read'})
  AND
  !(ActionMatches{'Microsoft.ContainerRegistry/registries/repositories/metadata/read'})
 )
 OR
 (
  @Request[Microsoft.ContainerRegistry/registries/repositories:name] StringStartsWith 'team-a/'
 )
)
EOT
}
