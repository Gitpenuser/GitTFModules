## USAGE
The `nic` module creates a Network Security Interface which could be used by other Azure resources.

## SECURITY REQUIREMENTS
- there is no possibility to attached public ip address to the NIC
- by defaul all NIC allocation must be done automaticaly
- logs must be send to the central Log Analytic Workspace

## CODE SAMPLE

This sample deploy a NIC using module

```hcl
data "azurerm_subnet" "subnet1" {
   resource_group_name     = "TerraformModules"
   virtual_network_name    = "vnet-westeurope-module-test"
   name                    = "snet-westeurope-module-test"
}

module "network_interface" {
    source = "git::https://github.com/Gitpenuser/GitTFModules.git//TFModules/NetworkInterface"
    resource_group_name = "TerraformModules"
    name                = "nic-tfmodules-001"
    subnet_id           = data.azurerm_subnet.subnet1.id
    private_ip_address  = "10.0.0.10"

    tags = {
        owner       = "aaaa.bbbb@company.com"
    }
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_accelerated_networking"></a> [enable\_accelerated\_networking](#input\_enable\_accelerated\_networking) | Enables Azure Accelerated Networking using SR-IOV. | `bool` | `false` | no |
| <a name="input_enable_ip_forwarding"></a> [enable\_ip\_forwarding](#input\_enable\_ip\_forwarding) | Enable IP forwarding for NIC | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the Network Interface should exist. Changing this forces a new resource to be created. | `string` | `"westeurope"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Network Interface. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | The Static IP Address which should be used | `any` | n/a | yes |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | The allocation method used for the Private IP Address. Dynamic value not allowed | `string` | `"Static"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which to create the Network Interface. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the Subnet where this Network Interface should be located in. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags: owner=jan.kowalski@nn.pl // appid=290 // environment=tst [options: dev/tst/prod] // description= test resource // deployment=auto [options:auto/manual] // costcenter=12345 | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_nic_name"></a> [ip\_nic\_name](#output\_ip\_nic\_name) | A name used for this IP Configuration. |
| <a name="output_location"></a> [location](#output\_location) | The location where the Network Interface should exist. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Network Interface. |
| <a name="output_nic_id"></a> [nic\_id](#output\_nic\_id) | Id of the Nic card |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | The Static IP Address which should be used |
| <a name="output_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#output\_private\_ip\_address\_allocation) | The allocation method used for the Private IP Address. Dynamic value not allowed |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the Resource Group in which to create the Network Interface. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the Subnet where this Network Interface should be located in. |
