locals {
  name_prefix      = "${var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : ""}"
  acr_default_name = "${local.name_prefix}${var.stack}${var.client_name}${var.location_short}${var.environment}acr"
  acr_name         = "${replace(coalesce(var.custom_name, local.acr_name), "-_", "")}"

  default_tags = {
    env   = "${var.environment}"
    stack = "${var.stack}"
  }
}
