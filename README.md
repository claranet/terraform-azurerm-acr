# Azure Container Registry
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/acr/azurerm/)

This Terraform module creates an [Azure Container Registry](https://docs.microsoft.com/en-us/azure/container-registry/).

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 5.x.x       | 0.15.x & 1.0.x    | >= 2.0          |
| >= 4.x.x       | 0.13.x            | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
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
  source  = "claranet/run-common/azurerm//modules/logs"
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

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name
  sku                 = "Standard"

  logs_destinations_ids = [
    module.logs.logs_storage_account_id,
    module.logs.log_analytics_workspace_id
  ]

  extra_tags = {
    foo = "bar"
  }
}

```

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.32 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | 4.0.2 |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_enabled | Specifies whether the admin user is enabled. | `bool` | `false` | no |
| allowed\_cidrs | List of CIDRs to allow on the registry | `list(string)` | `[]` | no |
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| custom\_name | Custom Azure Container Registry name, generated if not set | `string` | `""` | no |
| environment | Project environment | `string` | n/a | yes |
| extra\_tags | Additional tags to associate with your Azure Container Registry. | `map(string)` | `{}` | no |
| georeplication\_locations | A list of Azure locations where the container registry should be geo-replicated. | `list(string)` | `null` | no |
| images\_retention\_days | Specifies the number of images retention days. | `number` | `90` | no |
| images\_retention\_enabled | Specifies whether images retention is enabled (Premium only). | `bool` | `false` | no |
| location | Azure region to use | `string` | n/a | yes |
| location\_short | Short string for Azure location | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources Ids for logs diagnostics destination. Can be Storage Account, Log Analytics Workspace and Event Hub. No more than one of each can be set. Empty list to disable logging. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| logs\_retention\_days | Number of days to keep logs on storage account | `number` | `30` | no |
| name\_prefix | Optional prefix for Azure Container Registry name | `string` | `""` | no |
| resource\_group\_name | Name of the resource group | `string` | n/a | yes |
| sku | The SKU name of the the container registry. Possible values are Classic (which was previously Basic), Basic, Standard and Premium. | `string` | `"Standard"` | no |
| stack | Project stack name | `string` | n/a | yes |
| trust\_policy\_enabled | Specifies whether the trust policy is enabled (Premium only). | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| acr\_fqdn | The Container Registry FQDN. |
| acr\_id | The Container Registry ID. |
| acr\_name | The Container Registry name. |
| admin\_password | The Password associated with the Container Registry Admin account - if the admin account is enabled. |
| admin\_username | The Username associated with the Container Registry Admin account - if the admin account is enabled. |
| login\_server | The URL that can be used to log into the container registry. |
<!-- END_TF_DOCS -->
