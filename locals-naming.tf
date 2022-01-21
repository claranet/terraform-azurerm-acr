locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  acr_name = lower(coalesce(var.custom_name, azurecaf_name.acr.result))
}