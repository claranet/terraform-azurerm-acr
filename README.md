# Azure Container Registry

This Terraform module creates an [Azure Container Registry](https://docs.microsoft.com/en-us/azure/container-registry/).

## Requirements and limitations


## Usage

You can use this module by including it this way:
```hcl
module "az-region" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=vX.X.X"

  azure_region = "${var.azure_region}"
}

module "rg" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=vX.X.X"

  location     = "${module.az-region.location}"
  client_name  = "${var.client_name}"
  environment  = "${var.environment}"
  stack        = "${var.stack}"
}

module "acr" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/acr.git?ref=vX.X.X"

  location     = "${module.az-region.location}"
  rg_name      = "${module.rg.resource_group_name}"
  sku          = "${var.registry_sku}"
  client_name  = "${var.client_name}"
  environment  = "${var.environment}"
  stack        = "${var.stack}"
  custom_name  = "testacrcustom"

  extra_tags   = "${merge(local.default_tags, local.acr_custom_tags)}"
}

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin\_enabled | Specifies whether the admin user is enabled. | string | `"false"` | no |
| client\_name | Client name/account used in naming | string | n/a | yes |
| custom\_name | Custom Azure Container Registry name, generated if not set | string | `""` | no |
| environment | Project environment | string | n/a | yes | 
| extra\_tags | Additional tags to associate with your Azure Container Registry. | map | `<map>` | no |
| location | Azure region to use | string | n/a | yes |
| location\_short | Short string for Azure location | string | n/a | yes |
| name\_prefix | Optional prefix for Azure Container Registry name | string | `""` | no |
| resource\_group\_name | Name of the resource group | string | n/a | yes |
| sku | The SKU name of the the container registry. Possible values are Classic (which was previously Basic), Basic, Standard and Premium. | string | n/a | yes |
| stack | Project stack name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| admin\_password | The Password associated with the Container Registry Admin account - if the admin account is enabled. |
| admin\_username | The Username associated with the Container Registry Admin account - if the admin account is enabled. |
| id | The Container Registry ID. | 
| login\_server | The URL that can be used to log into the container registry. |
| name | The Container Registry name. |

## Related documentation

Terraform resource documentation: [https://www.terraform.io/docs/providers/azurerm/r/container_registry.html]
