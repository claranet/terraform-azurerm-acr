variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region to use"
}

variable "location_short" {
  description = "Short string for Azure location"
}

variable "environment" {
  description = "Project environment"
}

variable "stack" {
  description = "Project stack name"
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = "string"
}

variable "name_prefix" {
  description = "Optional prefix for Azure Container Registry name"
  type        = "string"
  default     = ""
}

variable "custom_name" {
  description = "Custom Azure Container Registry name, generated if not set"
  default     = ""
}

variable "sku" {
  description = "The SKU name of the the container registry. Possible values are Classic (which was previously Basic), Basic, Standard and Premium."
  type        = "string"
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled."
  type        = "string"
  default     = "false"
}

variable "extra_tags" {
  description = "Additional tags to associate with your Azure Container Registry."
  type        = "map"
  default     = {}
}
