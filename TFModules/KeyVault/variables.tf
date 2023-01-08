variable "name" {
  description = "(Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created.."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = "westeurope"
}


variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created."
  type        = string
}

variable "vm_access" {
  description = "(Optional) Will the Keyvault be used to store VM account and encryption keys?"
  type        = bool
  default     = false
}

variable "sku_name" {
  description = "(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium"
  type        = string
  default     = "standard"
}

variable "soft_delete_retention_days" {
  description = "(Optional) The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
  default     = 7
}

variable "purge_protection_enabled" {
  description = "(Optional) Is Purge Protection enabled for this Key Vault?"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags"
  type        = map(any)
  default     = {}
}


variable "ip_rules" {
  description = "(Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
  type        = list(string)
  default     = []
}

variable "virtual_network_subnet_ids" {
  description = "(Optional) One or more Subnet ID's which should be able to access this Key Vault."
  type        = list(string)
  default     = []
}


