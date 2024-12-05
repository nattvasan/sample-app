#
# Default
#

variable "external_dns_version" {
  type = string
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
}

variable "location" {
  type        = string
  description = "the Azure location"
  nullable    = false
}

variable "resource_group" {
  description = "the resource group object"
  nullable    = false
}

variable "hub_resource_group" {
  default     = null
  description = "Resource Group of this deployment"
}

variable "cluster_name" {
  type        = string
  description = "the cluster_name"
  nullable    = false
}

variable "env" {
  type        = string
  nullable    = false
  description = "Environment. One of \"dev\", \"test\", \"prod\", \"global\", \"demo\", \"int\" or  \"stg\"."
  validation {
    condition     = contains(["dev", "test", "prod", "global", "demo", "int", "stg", "vtr"], var.env)
    error_message = "Environment must be one of \"dev\", \"test\", \"prod\", \"demo\", \"int\", \"stg\" or \"global\"."
  }
}

variable "log_level" {
  type        = string
  description = "Log level of external-dns"
  nullable    = false
  default     = "debug" # TODO: make warning by default
  validation {
    condition     = contains(["panic", "debug", "info", "warning", "error", "fatal", "trace"], var.log_level)
    error_message = "`var.log_level` must be one of (\"panic\", \"debug\", \"info\", \"warning\", \"error\", \"fatal\", \"trace\")."
  }
}

#
# App
#

variable "application_namespace" {
  type        = string
  description = "Name of Kubernetes Namespace"
  nullable    = false
}

variable "public_domains" {
  type = object({
    azure = optional(list(string), [])
  })
  description = "Public domains used for this cluster."
  nullable    = false
  default     = {}
}

variable "enable_public_domains" {
  type        = bool
  description = "Whether handling public domains is enabled."
  nullable    = false
  default     = true
}

variable "private_ingress_class_name" {
  type        = string
  description = "Name of the ingress class used for internal communication."
  nullable    = false
}

variable "public_ingress_class_name" {
  type        = string
  description = "Name of the ingress class used for internet-facing communication."
  nullable    = false
}

variable "cluster_oidc_issuer_url" {
  type        = string
  description = "the cluster_oidc_issuer_url"
  nullable    = false
}

variable "private_dns_zone" {
  description = "Private domain Zone object used for this cluster, e.g., global.ifesw.com."
  nullable    = false
}

variable "kubelet_object_identity" {
  type = string
}

variable "kubelet_client_identity" {
  type = string
}
