# v5.1.0 - 2022-03-31

Added
  * AZ-697: Add `regional_endpoint_enabled` option in `georeplications` block

# v5.0.1 - 2022-03-10

Fixed
  * AZ-696: Apply lower function only for ACR `azurecaf_name`

# v5.0.0 - 2022-01-21

Breaking
  * AZ-515: Option to use Azure CAF naming provider to name resources
  * AZ-515: Require Terraform 0.13+

Added
  * AZ-615: Add an option to enable or disable default tags

# v4.4.0 - 2021-12-07

Added
  * AZ-620: Add `azure_services_bypass_allowed` input variable to configure `network_rule_bypass_option` parameter.

Changed
  * AZ-620: Update Azurerm Provider version (minimum 2.86)

# v4.3.0 - 2021-11-24

Fixed
  * AZ-589: Avoid plan drift when specifying categories
  * AZ-590: Rename `georeplication_locations` (deprecated) parameter to `georeplications` for `azurerm_container_registry` resource
  * AZ-590: Allow to enable trust policy and configure a retention policy only if Acr Sku is `Premium`

Changed
  * AZ-590: Update Azurerm Provider version (minimum 2.64)

# v4.2.0 - 2021-10-20

Added
  * AZ-504: Adding diagnostic logging, trust policies & retention options.
  * AZ-504: Adding Network rules (`ip_rules` and authorized subnets)

Changed
  * AZ-572: Revamp examples and improve CI

# v3.1.1/v4.1.1 - 2021-08-27

Changed
* AZ-532: Revamp README with latest `terraform-docs` tool

# v3.1.0/v4.1.0 - 2020-10-26

Changed
  * AZ-334: Force to lower the name of the ACR

# v3.0.1/v4.0.0 - 2020-10-20

Changed
  * AZ-273: Update README and CI, module compatible Terraform 0.13+ (now requires Terraform 0.12.26 minimum version)

# v3.0.0 - 2020-07-03

Changed
  * AZ-198: Update README and tag module compatible both AzureRM provider < 2.0 and >= 2.0

# v2.0.1 - 2020-02-12

Changed
  * AZ-178: Update README
  * AZ-179: Sanitize ACR resource name (remove invalid characters)

# v2.0.0 - 2020-01-31

Breaking
  * AZ-129: Upgrade to TF 0.12/HCL2


# v1.0.0 - 2019-11-22

Added
  * AZ-129: ACR First version
