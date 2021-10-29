resource "azurerm_container_registry" "registry" {
  name = local.acr_name

  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  admin_enabled       = var.admin_enabled


  dynamic "retention_policy" {
    for_each = var.images_retention_enabled && var.sku == "Premium" ? ["enabled"] : []

    content {
      enabled = var.images_retention_enabled
      days    = var.images_retention_days
    }
  }

  dynamic "trust_policy" {
    for_each = var.trust_policy_enabled && var.sku == "Premium" ? ["enabled"] : []

    content {
      enabled = var.trust_policy_enabled
    }
  }

  dynamic "georeplications" {
    for_each = var.georeplication_locations != null && var.sku == "Premium" ? var.georeplication_locations : []

    content {
      location                = georeplications.value.location
      zone_redundancy_enabled = georeplications.value.zone_redundancy_enabled
      tags                    = georeplications.value.tags
    }

  }

  dynamic "network_rule_set" {
    for_each = length(concat(var.allowed_cidrs, var.allowed_subnets)) > 0 ? ["enabled"] : []

    content {
      default_action = "Deny"

      dynamic "ip_rule" {
        for_each = var.allowed_cidrs
        content {
          action   = "Allow"
          ip_range = ip_rule.value
        }
      }

      dynamic "virtual_network" {
        for_each = var.allowed_subnets
        content {
          action    = "Allow"
          subnet_id = virtual_network.value
        }
      }
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}
