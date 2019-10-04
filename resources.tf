resource "azurerm_container_registry" "registry" {
  name = "${coalesce(var.custom_name, local.acr_name)}"

  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  sku           = "${var.sku}"
  admin_enabled = "${var.admin_enabled}"

  tags = "${merge(local.default_tags, var.extra_tags)}"
}
