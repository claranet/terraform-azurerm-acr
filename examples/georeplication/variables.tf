# Wrapper env herited vars

variable "azure_region" {
  type        = string
  description = "Azure region to use"
}

variable "azure_tenant_id" {
  type        = string
  description = "Azure tenant id"
}

variable "azure_state_access_key" {
  type        = string
  description = "Access key to use to access to terraform state"
}

variable "client_name" {
  type        = string
  description = "Client name/account used in naming"
}

variable "environment" {
  type        = string
  description = "Project environment"
}

variable "stack" {
  type        = string
  description = "Project stack name"
}

