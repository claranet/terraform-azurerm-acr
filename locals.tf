locals {
  name_prefix           = "${var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : ""}"
  acr_default_name_long = "${local.name_prefix}${var.stack}${var.client_name}${var.location_short}${var.environment}acr"
  acr_name              = "${coalesce(var.custom_name, substr(local.acr_default_name_long, 0, length(local.acr_default_name_long) > 50 ? 49 : -1))}"

  default_tags = {
    env   = "${var.environment}"
    stack = "${var.stack}"
  }
}
