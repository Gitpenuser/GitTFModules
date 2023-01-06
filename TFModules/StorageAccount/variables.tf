variable "name" {
  description = "The name of the azure storage account"
  type        = string
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "The resource group name where the storage account will be deployed under."
  type        = string
}

variable "account_kind" {
  description = "The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "The performance of Storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
  default     = "Hot"
}

variable "allow_blob_public_access" {
  description = "allow blob public access"
  type        = bool
  default     = false
}


variable "is_hns_enabled" {
  description = "(Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "tags" {
  description = "tags"
  type        = map(any)
  default     = {}
}

variable "shared_access_key_enabled" {
  description = "(Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). The default value is true."
  type        = bool
  default     = false

}


variable "default_action" {
  description = "(Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow"
  type        = string
  default     = "Deny"
}
variable "bypass" {
  description = "Network rules restricing access to the storage account - bypass"
  type        = string
  default     = "AzureServices"
}

variable "ip_rules" {
  description = "(Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the storage account."
  type        = list(string)
  default     = []
}

variable "virtual_network_subnet_ids" {
  description = "(Optional) One or more Subnet ID's which should be able to access this storage account."
  type        = list(string)
  default     = []
}

variable "soft_delete_retention" {
  description = "Number of retention days for soft delete. If set to null it will disable soft delete all together."
  default     = 7
}


