/**
 * 
 * # Storage Account
 * ## Certified Storage Account
 * 
 * To be certified, a storage account should (MoSCoW)
 * 
 * - Default Network rule - deny any (SHOULD)
 * - enforced HTTPS (MUST)
 * - enforced TLS 1.2 (MUST)
 * - Disallowed Shared Key authorization (SHOULD)
 * - Disable anonymous public read access to containers and blobs (SHOULD)
 * - Use private endpoints (COULD)
 * ## Code Example
 * ```hcl
 * module "sa" {
 *   source              = "git::https://github.com/<user>/<repository>.git//TFModules/KeyVault"
 *   name                = "stmodule002"
 *   resource_group_name = "rg-tfmodules-001"
 *   tags = {
 *      owner       = "aaaa.bbbb@company.com"
 *      appid       = "9999"
 *      environment = "tst"
 *      description = "Storage account created from the module"
 *      deployment  = "auto"
 *      costcenter  = "it999"
 *   }
 * }
 * ```
 */

############################
# Create the Storage Account
############################
resource "azurerm_storage_account" "sa" {
  name                     = var.name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  # allow_blob_public_access  = var.allow_blob_public_access
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  is_hns_enabled                  = var.is_hns_enabled
  tags                            = var.tags
  enable_https_traffic_only       = true
  min_tls_version                 = "TLS1_2"
  shared_access_key_enabled       = var.shared_access_key_enabled

  network_rules {
    default_action             = var.default_action
    bypass                     = [var.bypass]
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  dynamic "blob_properties" {
    for_each = var.is_hns_enabled == false ? [true] : []
    content {
      delete_retention_policy {
        days = var.soft_delete_retention
      }
    }
  }
}