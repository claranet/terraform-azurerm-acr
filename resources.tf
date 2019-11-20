resource "azurerm_container_registry" "registry" {
  name = "${local.acr_name}"

  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  sku           = "${var.sku}"
  admin_enabled = "${var.admin_enabled}"

  # TF 0.11 hack to remove with HCL2
  georeplication_locations = ["${coalescelist(var.georeplication_locations, list(var.location))}"]

  tags = "${merge(local.default_tags, var.extra_tags)}"
}
