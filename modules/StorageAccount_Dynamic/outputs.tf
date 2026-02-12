output "storage_account_id" {
  value = azurerm_storage_account.StorgaeAccount.id
}

output "storage_account_name" {
  value = azurerm_storage_account.StorgaeAccount.name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.StorgaeAccount.primary_blob_endpoint
}

output "blob_containers" {
  value = {
    for k, v in azurerm_storage_container.containers :
    k => v.name
  }
}

output "blob_properties" {
  value = var.blob_properties
}

output "file_shares" {
  value = {
    for k, v in azurerm_storage_share.file_shares :
    k => v.name
  }
}

