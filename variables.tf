variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to use"
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "name_prefix" {
  description = "Optional prefix for Azure Container Registry name"
  type        = string
  default     = ""
}

variable "custom_name" {
  description = "Custom Azure Container Registry name, generated if not set"
  type        = string
  default     = ""
}

variable "sku" {
  description = "The SKU name of the the container registry. Possible values are Classic (which was previously Basic), Basic, Standard and Premium."
  type        = string
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled."
  type        = bool
  default     = false
}

variable "extra_tags" {
  description = "Additional tags to associate with your Azure Container Registry."
  type        = map(string)
  default     = {}
}

variable "georeplication_locations" {
  description = "A list of Azure locations where the container registry should be geo-replicated."
  type        = list(string)
  default     = null
}

variable "retention_enabled" {
  description = "Specifies whether the retention is enabled."
  type        = bool
  default     = false
}

variable "retention_days" {
  description = "Specifies whether the number of retention days."
  type        = number
  default     = 7
}

variable "logs_destinations_ids" {
  type        = list(string)
  description = "List of destination resources Ids for logs diagnostics destination. Can be Storage Account, Log Analytics Workspace and Event Hub. No more than one of each can be set. Empty list to disable logging."
}

variable "logs_categories" {
  type        = list(string)
  description = "Log categories to send to destinations."
  default     = null
}

variable "logs_metrics_categories" {
  type        = list(string)
  description = "Metrics categories to send to destinations."
  default     = null
}

variable "logs_retention_days" {
  type        = number
  description = "Number of days to keep logs on storage account"
  default     = 30
}


variable "trust_policy_enabled" {
  description = "Specifies whether the trust policy is enabled."
  type        = bool
  default     = false
}

variable "network_rule_set" {
  description = "Object with attributes: `default_action`, `ip_rules`"
  default     = null

  type = object({
    default_action = string,
    ip_rules       = list(string),
  })
}


