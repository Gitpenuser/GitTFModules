/**
 * 
 * # Key Vault
 * 
 * A key vault is used for storing and reading secrets like password, keys and certificates.
 * 
 * Typically:
 * 
 * - VM admin and password
 * - VM disk encryption key
 * - self signed certificate
 * - external API key/secret
 * 
 * ## Certified Key Vault
 * 
 * To be certified, a Key Vault should
 * 
 * - Network rule -default-action-deny (SHOULD)
 * - Enable Purge Protection	(SHOULD)
 * - Enable Soft delete	(SHOULD)
 * - Use a private endpoint (SHOULD)
 * 
 * Out of scope: 
 * 
 * ## Code sample
 * 
 * This sample deploy a keyvault with the pipeline account setup to be able to store VM encryption keys and credentials. And whitelist a server at 1.1.1.1.
 * 
 * ```hcl
 * 
 * module "keyvault" {
 *   source              = "git::https://github.com/<user>/<repository>.git//TFModules/KeyVault"
 *   name                = "kvmodulepm001"
 *   resource_group_name = "rg-tfmodules-001"
 *   vm_access           = true 
 *   ip_rules            = ["1.1.1.1/32"] #optional
 *   tags = {
 *       owner       = "aaaa.bbbb@company.com"
 *       appid       = "9999"
 *       environment = "tst"
 *       description = "terraform module testing"
 *       deployment  = "auto"
 *       costcenter  = "it999"
 *   }
 * }
 * ```
 */


resource "azurerm_key_vault" "kv" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  enabled_for_deployment          = var.vm_access
  enabled_for_disk_encryption     = var.vm_access
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  sku_name                        = var.sku_name
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  enabled_for_template_deployment = true

  tags = var.tags


  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }
}

