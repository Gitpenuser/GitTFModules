output "resource_group_name" {
  description = "The name of the Resource Group in which to create the Network Interface."
  value       = azurerm_network_interface.nic.resource_group_name
}

output "location" {
  description = "The location where the Network Interface should exist."
  value       = azurerm_network_interface.nic.location

}

output "name" {
  description = "The name of the Network Interface."
  value       = azurerm_network_interface.nic.name
}

output "ip_nic_name" {
  description = "A name used for this IP Configuration."
  value       = azurerm_network_interface.nic.ip_configuration[0].name
}

output "subnet_id" {
  description = "The ID of the Subnet where this Network Interface should be located in."
  value       = azurerm_network_interface.nic.ip_configuration[0].subnet_id
}

output "private_ip_address_allocation" {
  description = "The allocation method used for the Private IP Address. Dynamic value not allowed"
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address_allocation
}

output "private_ip_address" {
  description = "The Static IP Address which should be used"
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address

}

output "nic_id" {
  description = "Id of the Nic card"
  value       = azurerm_network_interface.nic.id

}