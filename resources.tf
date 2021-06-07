
resource "azurerm_container_registry" "registry" {
  name = lower(local.acr_name)

  location            = var.location
  resource_group_name = var.resource_group_name

  sku           = var.sku
  admin_enabled = var.admin_enabled

  georeplication_locations = var.georeplication_locations

  retention_policy {
    enabled = var.retention_enabled
    days    = var.retention_days
  }

  trust_policy {
    enabled = var.trust_policy_enabled
  }

  dynamic "network_rule_set" {
    for_each = var.network_rule_set == null ? [] : [var.network_rule_set]

    content {
      default_action = lookup(network_rule_set.value, "default_action")
      dynamic "ip_rule" {
        for_each = lookup(network_rule_set.value, "ip_rules", {})
        content {
          action   = "Allow"
          ip_range = ip_rule.value
        }
      }
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}

