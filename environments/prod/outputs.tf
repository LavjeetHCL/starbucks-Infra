
output "storage_account_id" {
  description = "The ID of the storage account"
  value       = module.storage_with_blob.storage_account_id
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.storage_with_blob.storage_account_name
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint"
  value       = module.storage_with_blob.primary_blob_endpoint
}

output "blob_containers" {
  description = "Map of created blob containers"
  value       = module.storage_with_blob.blob_containers
}

output "blob_properties" {
  description = "The blob properties of the storage account"
  value       = module.storage_with_blob.blob_properties
}

output "file_shares" {
  description = "The files shares details"
  value       = module.storage_with_blob.file_shares
}
