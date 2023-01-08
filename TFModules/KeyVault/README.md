
# Key Vault

A key vault is used for storing and reading secrets like password, keys and certificates.

Typically:

- VM admin and password
- VM disk encryption key
- self signed certificate
- external API key/secret

## Certified Key Vault

To be certified, a Key Vault should

- Network rule -default-action-deny (SHOULD)
- Enable Purge Protection	(SHOULD)
- Enable Soft delete	(SHOULD)
- Use a private endpoint (SHOULD)

Out of scope:

## Code sample

This sample deploy a keyvault with the pipeline account setup to be able to store VM encryption keys and credentials. And whitelist a server at 1.1.1.1.

```hcl

module "keyvault" {
  source              = "git::https://github.com/<user>/<repository>.git//TFModules/KeyVault"
  name                = "kvmodulepm001"
  resource_group_name = "rg-tfmodules-001"
  vm_access           = true
  ip_rules            = ["1.1.1.1/32"] #optional
  tags = {
      owner       = "aaaa.bbbb@company.com"
      appid       = "9999"
      environment = "tst"
      description = "terraform module testing"
      deployment  = "auto"
      costcenter  = "it999"
  }
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault. | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | `"westeurope"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created.. | `string` | n/a | yes |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | (Optional) Is Purge Protection enabled for this Key Vault? | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium | `string` | `"standard"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | (Optional) The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days. | `number` | `7` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | `{}` | no |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | (Optional) One or more Subnet ID's which should be able to access this Key Vault. | `list(string)` | `[]` | no |
| <a name="input_vm_access"></a> [vm\_access](#input\_vm\_access) | (Optional) Will the Keyvault be used to store VM account and encryption keys? | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Key Vault. |
| <a name="output_vault_uri"></a> [vault\_uri](#output\_vault\_uri) | The URI of the Key Vault, used for performing operations on keys and secrets. |
