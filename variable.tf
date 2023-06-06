variable "name" {
  type        = string
  description = "key vault name"
}
variable "location" {
  type        = string
  description = "location of the key vault"
}
variable "resource_group_name" {
  type        = string
  description = "resource group of the key vault"
}
variable "soft_delete_retention_days" {
  type        = number
  description = "how much is the soft delete retention days for the key vault"
  default     = 7
}
variable "purge_protection_enabled" {
  type        = bool
  description = "whether purge_protection is enabledfor the key vault"
  default     = true
}
variable "sku_name" {
  type        = string
  description = "sku for the key vault"
}
variable "public_network_access_enabled" {
  type        = string
  description = "monitor_name for the key vault"
}
variable "storage_name" {
  type        = string
  description = "storage_name for the key vault"
}
variable "monitor_name" {
  type        = string
  description = "monitor_name for the key vault"
}