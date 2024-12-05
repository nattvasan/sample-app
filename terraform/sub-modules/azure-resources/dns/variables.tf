# defaults
variable "location" {
  type        = string
  description = "name of the location"
}

variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "tags" {
  description = "these tags are applied to every resource within this module"
  type        = map(string)
  default     = { Created-by = "DevOps-admins-terraformed" }
}

variable "hub_vnet_id" {
  type        = string
  description = "HUB V-Net ID"
}