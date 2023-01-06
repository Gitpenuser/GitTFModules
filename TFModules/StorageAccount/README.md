
# Storage Account
## Certified Storage Account

To be certified, a storage account should

- Default Network rule - deny any
- enforced HTTPS
- enforced TLS 1.2
- Disallowed Shared Key authorization
- Disable anonymous public read access to containers and blobs
- Use private endpoints
## Code Example
```hcl
module "sa" {
  source              = "git::https://dev.azure.com/<organization>/<project>/_git/modules//general/StorageAccount"
  name                = "stmodule002"
  resource_group_name = "rg-tfmodules-001"
  tags = {
     owner       = "aaaa.bbbb@company.com"
     appid       = "9999"
     environment = "tst"
     description = "Storage account created from the module"
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
| [azurerm_storage_account.sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool. | `string` | `"Hot"` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | Storage account replication type | `string` | `"LRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | The performance of Storage account | `string` | `"Standard"` | no |
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | Allow or disallow nested items within this Account to opt into being public. | `bool` | `false` | no |
| <a name="input_bypass"></a> [bypass](#input\_bypass) | Network rules restricing access to the storage account - bypass | `string` | `"AzureServices"` | no |
| <a name="input_default_action"></a> [default\_action](#input\_default\_action) | (Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow | `string` | `"Deny"` | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the storage account. | `list(string)` | `[]` | no |
| <a name="input_is_hns_enabled"></a> [is\_hns\_enabled](#input\_is\_hns\_enabled) | (Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | `"westeurope"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the azure storage account | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group name where the storage account will be deployed under. | `string` | n/a | yes |
| <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled) | (Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). The default value is true. | `bool` | `false` | no |
| <a name="input_soft_delete_retention"></a> [soft\_delete\_retention](#input\_soft\_delete\_retention) | Number of retention days for soft delete. If set to null it will disable soft delete all together. | `number` | `7` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `map(any)` | `{}` | no |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | (Optional) One or more Subnet ID's which should be able to access this storage account. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_blob_endpoint"></a> [default\_blob\_endpoint](#output\_default\_blob\_endpoint) | The endpoint URL for the default blob storage account in the primary location |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_output"></a> [output](#output\_output) | The output of the storage account creation. |
| <a name="output_primary_blob_endpoint"></a> [primary\_blob\_endpoint](#output\_primary\_blob\_endpoint) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
