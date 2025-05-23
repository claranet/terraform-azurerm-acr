# Azure Container Registry
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/acr/azurerm/)

This Terraform module creates an [Azure Container Registry](https://docs.microsoft.com/en-us/azure/container-registry/).

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
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
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | ~> 8.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurecaf_name.acr](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_enabled | Whether the admin user is enabled. | `bool` | `false` | no |
| allowed\_cidrs | List of CIDRs to allow on the Container Registry. | `list(string)` | `[]` | no |
| azure\_services\_bypass\_allowed | Whether to allow trusted Azure services to access a network restricted Container Registry. | `bool` | `false` | no |
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| custom\_name | Custom Azure Container Registry name, generated if not set. | `string` | `""` | no |
| data\_endpoint\_enabled | Whether to enable dedicated data endpoints for this Container Registry? (Only supported on resources with the Premium SKU). | `bool` | `false` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| diagnostic\_settings\_custom\_name | Custom name of the diagnostics settings, name will be 'default' if not set. | `string` | `"default"` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Additional tags to associate with your Azure Container Registry. | `map(string)` | `{}` | no |
| georeplication\_locations | A list of Azure locations where the Container Registry should be geo-replicated. Only activated on Premium SKU.<br/>  Supported properties are:<br/>    location                  = string<br/>    zone\_redundancy\_enabled   = bool<br/>    regional\_endpoint\_enabled = bool<br/>    tags                      = map(string)<br/>  or this can be a list of `string` (each element is a location) | `any` | `[]` | no |
| identity | Identity block information. | <pre>object({<br/>    type         = optional(string, "SystemAssigned")<br/>    identity_ids = optional(list(string))<br/>  })</pre> | `{}` | no |
| images\_retention\_days | Specifies the number of images retention days. | `number` | `90` | no |
| images\_retention\_enabled | Specifies whether images retention is enabled (Premium only). | `bool` | `false` | no |
| location | Azure region to use. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination.<br/>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br/>If you want to use Azure EventHub as a destination, you must provide a formatted string containing both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>&#124;</code> character. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| public\_network\_access\_enabled | Whether the Container Registry is accessible publicly. | `bool` | `true` | no |
| resource\_group\_name | Name of the resource group. | `string` | n/a | yes |
| sku | The SKU name of the the Container Registry. Possible values are `Classic` (which was previously `Basic`), `Basic`, `Standard` and `Premium`. | `string` | `"Standard"` | no |
| stack | Project stack name. | `string` | n/a | yes |
| trust\_policy\_enabled | Specifies whether the trust policy is enabled (Premium only). | `bool` | `false` | no |
| zone\_redundancy\_enabled | Whether zone redundancy is enabled for this Container Registry? Changing this forces a new resource to be created. Defaults to false. (Only supported on resources with the Premium SKU) | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| admin\_password | Password associated with the Container Registry admin account - if the admin account is enabled. |
| admin\_username | Username associated with the Container Registry admin account - if the admin account is enabled. |
| fqdn | Azure Container Registry FQDN. |
| id | Azure Container Registry ID. |
| identity\_principal\_id | Azure Container Registry system identity principal ID. |
| login\_server | URL that can be used to log into the Container Registry. |
| module\_diagnostics | Diagnostics Settings module output. |
| name | Azure Container Registry name. |
| resource | Azure Container Registry resource output. |
<!-- END_TF_DOCS -->
