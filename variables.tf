variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region to use."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "environment" {
  description = "Project environment."
  type        = string
}

variable "stack" {
  description = "Project stack name."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming."
  type        = string
}

variable "sku" {
  description = "The SKU name of the the Container Registry. Possible values are `Classic` (which was previously `Basic`), `Basic`, `Standard` and `Premium`."
  type        = string
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Whether the admin user is enabled."
  type        = bool
  default     = false
}

variable "georeplication_locations" {
  description = <<DESC
  A list of Azure locations where the Container Registry should be geo-replicated. Only activated on Premium SKU.
  Supported properties are:
    location                        = string
    global_endpoint_routing_enabled = bool
    zone_redundancy_enabled         = bool
    tags                            = map(string)
  or this can be a list of `string` (each element is a location)
DESC
  type        = any
  default     = []
}

variable "images_retention_enabled" {
  description = "Specifies whether images retention is enabled (Premium only)."
  type        = bool
  default     = false
}

variable "images_retention_days" {
  description = "Specifies the number of images retention days."
  type        = number
  default     = 90
}

variable "azure_services_bypass_allowed" {
  description = "Whether to allow trusted Azure services to access a network restricted Container Registry."
  type        = bool
  default     = false
}

variable "allowed_cidrs" {
  description = "List of CIDRs to allow on the Container Registry."
  default     = []
  type        = list(string)
}

variable "public_network_access_enabled" {
  description = "Whether the Container Registry is accessible publicly."
  type        = bool
  default     = true
}

variable "data_endpoint_enabled" {
  description = "Whether to enable dedicated data endpoints for this Container Registry? (Only supported on resources with the Premium SKU)."
  default     = false
  type        = bool
}

variable "zone_redundancy_enabled" {
  description = "Whether zone redundancy is enabled for this Container Registry? Changing this forces a new resource to be created. Defaults to false. (Only supported on resources with the Premium SKU)"
  default     = false
  type        = bool
}

variable "identity" {
  description = "Identity block information."
  type = object({
    type         = optional(string, "SystemAssigned")
    identity_ids = optional(list(string))
  })
  default  = {}
  nullable = false
}

variable "role_assignment_mode" {
  description = "Role assignment mode of the Container Registry. Possible values are `LegacyRegistryPermissions` (registry-wide RBAC roles) and `AbacRepositoryPermissions` (repository-scoped ABAC roles). Registries already switched to ABAC must set `AbacRepositoryPermissions`, otherwise the next apply downgrades them."
  type        = string
  default     = "LegacyRegistryPermissions"
  nullable    = false

  validation {
    condition     = contains(["LegacyRegistryPermissions", "AbacRepositoryPermissions"], var.role_assignment_mode)
    error_message = "`role_assignment_mode` must be `LegacyRegistryPermissions` or `AbacRepositoryPermissions`."
  }
}

variable "azuread_authentication_as_arm_policy_enabled" {
  description = "Whether to use Azure Resource Manager audience token for this Container Registry."
  type        = bool
  default     = true
  nullable    = false
}

variable "network_rule_bypass_for_tasks_enabled" {
  description = "Whether to allow Container Registry Tasks to access a network-restricted Container Registry."
  type        = bool
  default     = false
  nullable    = false
}

variable "quarantine_policy_enabled" {
  description = "Whether the quarantine policy is enabled (Premium only)."
  type        = bool
  default     = false
  nullable    = false
}

variable "export_policy_enabled" {
  description = "Whether the export policy is enabled (Premium only). Can only be disabled when `public_network_access_enabled` is `false`."
  type        = bool
  default     = true
  nullable    = false
}
