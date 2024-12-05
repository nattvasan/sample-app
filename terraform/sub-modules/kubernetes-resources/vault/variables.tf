#
# Default
#

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "location" {
  type = string
}

variable "tags" {
  type     = map(string)
  nullable = false
}

variable "resource_group" {
  description = "the resource group object"
  nullable    = false
}

variable "domain" {
  type        = string
  description = "The primary domain for DNS entries"
  nullable    = false
}

variable "env" {
  type        = string
  nullable    = false
  description = "Environment. One of \"dev\", \"test\", \"prod\", \"global\", \"demo\", \"int\" or  \"stg\"."
  validation {
    condition     = contains(["dev", "test", "prod", "global", "demo", "int", "stg"], var.env)
    error_message = "Environment must be one of \"dev\", \"test\", \"prod\", \"demo\", \"int\", \"stg\" or \"global\"."
  }
}

variable "ingress_class" {
  type        = string
  description = "Name of the ingress class to use"
  nullable    = false
  default     = "internal"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
}

variable "application_namespace" {
  type        = string
  description = "Name of Kubernetes Namespace"
  nullable    = false
  default     = "vault"
}

variable "vault_version" {
  type = string
}

#
# Network
#

variable "subnet" {
  type     = string
  nullable = false
}

#
# AKV
#

variable "cluster_client_identity" {
  description = "cluster_client_identity"
  nullable    = false
}

variable "vault_ui_redirect_address" {
  type        = string
  default     = "http://localhost:8250"
  description = "DNS hostname or IP address of Vault's UI."
}

variable "app_owners" {
  type        = list(string)
  default     = null
  description = "A set of object IDs of principals that will be granted ownership of the application."
}
