variable "prometheus_version" {
  type = string
}

variable "thanos_version" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group" {
  description = "the resource group object"
  nullable    = false
}

variable "tags" {
  type    = map(string)
  default = { Created_by = "DevOps-Admins-Terragrunted" }
}

variable "application_namespace" {
  type        = string
  description = "Name of Kubernetes Namespace"
  nullable    = false
  default     = "prometheus"
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

variable "domain" {
  type        = string
  description = "Primary domain for DNS entries"
  nullable    = false
}

variable "cluster_name" {
  type        = string
  description = "the cluster_name"
  nullable    = false
}

variable "cluster_oidc_issuer_url" {
  type        = string
  description = "the cluster_oidc_issuer_url"
  nullable    = false
}

variable "ingress_class" {
  type        = string
  description = "Name of the ingress class to use"
  nullable    = false
  default     = "internal"
}

variable "metrics_auth_username" {
  type        = string
  description = "Name of the user for prometheus metrics"
  nullable    = false
  sensitive   = true
}

variable "metrics_auth_password" {
  type        = string
  description = "Password of the user for prometheus metrics"
  nullable    = false
  sensitive   = true
}


variable "subscription_resource_id" {
  type        = string
  description = "Azure resource ID of subscription that Grafana can read from"
}

variable "kubelet_client_id" {
  type        = string
  description = "client ID of AKS kubelet identity"
}

#
# Postgres
#

variable "db_server_credentials" {
  type = object({
    host     = string
    database = string
    username = string
    password = string
  })
  sensitive = true
  nullable  = false
}
