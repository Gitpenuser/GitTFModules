output "output" {
  description = "The output of the storage account creation."
  value       = azurerm_storage_account.sa
  sensitive   = true
}


output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.sa.primary_blob_endpoint
}

output "id" {
  value = azurerm_storage_account.sa.id
}


output "default_blob_endpoint" {
  description = "The endpoint URL for the default blob storage account in the primary location"
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}