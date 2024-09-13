## 7.0.0 (2024-09-13)

### ⚠ BREAKING CHANGES

* **AZ-840:** AzureRM provider v3+ required

### Features

* **AZ-840:** prepare `v7.0` 13cf2ad

### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] c0e1985
* **AZ-1391:** update semantic-release config [skip ci] e16effb

### Miscellaneous Chores

* **deps:** add renovate.json 15d6944
* **deps:** enable automerge on renovate e1ff8ea
* **deps:** update dependency opentofu to v1.7.0 0ffe4fe
* **deps:** update dependency opentofu to v1.7.1 f9c0fd0
* **deps:** update dependency opentofu to v1.7.2 f39eb2c
* **deps:** update dependency opentofu to v1.7.3 6ec56bc
* **deps:** update dependency opentofu to v1.8.0 363a409
* **deps:** update dependency opentofu to v1.8.1 ff54b7e
* **deps:** update dependency opentofu to v1.8.2 128a0e0
* **deps:** update dependency pre-commit to v3.7.1 31cd61b
* **deps:** update dependency pre-commit to v3.8.0 a0fc74c
* **deps:** update dependency terraform-docs to v0.18.0 f0ecfab
* **deps:** update dependency tflint to v0.51.0 210378b
* **deps:** update dependency tflint to v0.51.1 81716b4
* **deps:** update dependency tflint to v0.51.2 9f851c9
* **deps:** update dependency tflint to v0.52.0 d767f49
* **deps:** update dependency tflint to v0.53.0 34d8e7e
* **deps:** update dependency trivy to v0.50.2 db41280
* **deps:** update dependency trivy to v0.50.4 5385854
* **deps:** update dependency trivy to v0.51.0 ff7b97d
* **deps:** update dependency trivy to v0.51.1 97cdddd
* **deps:** update dependency trivy to v0.51.2 d234cde
* **deps:** update dependency trivy to v0.51.3 ebf4166
* **deps:** update dependency trivy to v0.51.4 fcf5def
* **deps:** update dependency trivy to v0.52.0 94dc2ec
* **deps:** update dependency trivy to v0.52.1 2aac548
* **deps:** update dependency trivy to v0.52.2 561fea7
* **deps:** update dependency trivy to v0.53.0 865c2f4
* **deps:** update dependency trivy to v0.54.1 7fdecfe
* **deps:** update dependency trivy to v0.55.0 33d4d99
* **deps:** update dependency trivy to v0.55.1 f648576
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 e37d899
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 a7c82f0
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 662b5d2
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 afb79f0
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 634b5d1
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 380c4b9
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 76c3ad8
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 8bc7fde
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 72274c2
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 c957bed
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 9ee85e2
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 504b9a6
* **deps:** update renovate.json 3df7d69
* **pre-commit:** update commitlint hook 64026fa
* **release:** remove legacy `VERSION` file 985f83d

# v6.3.0 - 2023-09-29

Added
  * AZ-1153: Bump diagnostic-settings module

# v6.2.0 - 2022-12-09

Added
  * AZ-885: Add `data_endpoint_enabled` option for dedicated endpoints.

# v6.1.0 - 2022-11-30

Added
  * AZ-921: Add `public_network_access_enabled` variable

# v6.0.0 - 2022-11-25

Breaking
  * AZ-839: Require Terraform 1.1+ and AzureRM provider `v3.22+`

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

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
