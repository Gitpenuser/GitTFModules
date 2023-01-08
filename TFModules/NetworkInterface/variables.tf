
variable "resource_group_name" {
  description = "The name of the Resource Group in which to create the Network Interface. Changing this forces a new resource to be created."
}
variable "location" {
  description = "The location where the Network Interface should exist. Changing this forces a new resource to be created."
  default     = "westeurope"
}

variable "name" {
  description = "The name of the Network Interface. Changing this forces a new resource to be created."
}
variable "enable_ip_forwarding" {
  description = "Enable IP forwarding for NIC"
  default     = false
}

variable "enable_accelerated_networking" {
  description = "Enables Azure Accelerated Networking using SR-IOV."
  default     = false
}

variable "tags" {
  description = "Tags"
  type        = map(any)
  default     = {}
}

variable "subnet_id" {
  description = "The ID of the Subnet where this Network Interface should be located in."
}
variable "private_ip_address_allocation" {
  description = "The allocation method used for the Private IP Address. Dynamic value not allowed"
  default     = "Static"
}

variable "private_ip_address" {
  description = "The Static IP Address which should be used"
}