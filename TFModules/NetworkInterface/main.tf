/**
  * ## USAGE
  * The `nic` module creates a Network Security Interface which could be used by other Azure resources.
  * 
  * ## SECURITY REQUIREMENTS
  * - there is no possibility to attached public ip address to the NIC
  * - by defaul all NIC allocation must be done automaticaly
  * - logs must be send to the central Log Analytic Workspace
  *
  * ## CODE SAMPLE
  * 
  * This sample deploy a NIC using module
  * 
  * ```hcl
  * data "azurerm_subnet" "subnet1" {
  *    resource_group_name     = "TerraformModules"
  *    virtual_network_name    = "vnet-westeurope-module-test"
  *    name                    = "snet-westeurope-module-test"
  * }
  * 
  * 
  * module "network_interface" {
  *     source = "git::https://github.com/Gitpenuser/GitTFModules.git//TFModules/NetworkInterface"
  *     resource_group_name = "TerraformModules"
  *     name                = "nic-tfmodules-001"
  *     subnet_id           = data.azurerm_subnet.subnet1.id
  *     private_ip_address  = "10.0.0.10"
  *  
  *     tags = {
  *         owner       = "aaaa.bbbb@company.com"
  *     }
  * }
  * ```
  */


resource "azurerm_network_interface" "nic" {
  resource_group_name           = var.resource_group_name
  location                      = var.location
  name                          = var.name
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  tags                          = var.tags

  ip_configuration {
    name                          = "${var.name}-ip"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address            = var.private_ip_address

  }
}