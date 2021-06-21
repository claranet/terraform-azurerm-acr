resource "azurerm_container_registry" "registry" {
  name = local.acr_name

  location                 = var.location
  resource_group_name      = var.resource_group_name
  sku                      = var.sku
  admin_enabled            = var.admin_enabled
  georeplication_locations = var.georeplication_locations

  retention_policy {
    enabled = var.images_retention_enabled
    days    = var.images_retention_days
  }

  trust_policy {
    enabled = var.trust_policy_enabled
  }

  dynamic "network_rule_set" {
    for_each = length(var.allowed_cidrs) > 0 ? ["_"] : []

    content {
      default_action = "Deny"
      dynamic "ip_rule" {
        for_each = var.allowed_cidrs
        content {
          action   = "Allow"
          ip_range = ip_rule.value
        }
      }
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}
