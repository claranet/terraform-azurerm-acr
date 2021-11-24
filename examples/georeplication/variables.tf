# Wrapper env herited vars

variable "azure_region" {
  type        = string
  description = "Azure region to use"
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

