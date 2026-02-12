# Create a resource group
module "resource_group" {
  source              = "../../modules/ResourceGroup"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}


# Create a storage account with blob configuration
module "storage_with_blob" {
  depends_on = [module.resource_group]
  source     = "../../modules/StorageAccount_Dynamic"

  storage_account_name = var.storage_account_name
  resource_group_name  = var.resource_group_name
  location             = var.location

  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier

  https_traffic_only_enabled = var.https_traffic_only_enabled

  blob_properties    = var.blob_properties
  network_rules      = var.network_rules
  managed_identities = var.managed_identities

  enable_containers = var.enable_containers
  containers        = var.containers

  enable_file_shares = var.enable_file_shares
  file_shares        = var.file_shares

  public_network_access_enabled     = var.public_network_access_enabled
  allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  shared_access_key_enabled = var.shared_access_key_enabled
  local_user_enabled       = var.local_user_enabled
  
  is_hns_enabled           = var.is_hns_enabled
  min_tls_version          = var.min_tls_version
  large_file_share_enabled = var.large_file_share_enabled
  nfsv3_enabled            = var.nfsv3_enabled

  tags = var.tags
}
