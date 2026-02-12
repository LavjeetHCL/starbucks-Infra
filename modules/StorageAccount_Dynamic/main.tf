resource "azurerm_storage_account" "StorgaeAccount" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location

  account_kind             = var.account_kind
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier

  public_network_access_enabled     = var.public_network_access_enabled
  allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  https_traffic_only_enabled        = var.https_traffic_only_enabled
  min_tls_version                   = var.min_tls_version

  is_hns_enabled            = var.is_hns_enabled
  nfsv3_enabled             = var.nfsv3_enabled
  large_file_share_enabled  = var.large_file_share_enabled
  shared_access_key_enabled = var.shared_access_key_enabled
  local_user_enabled = var.local_user_enabled
  dynamic "identity" {
    for_each = var.managed_identities != null ? [var.managed_identities] : []
    content {
      type = identity.value.system_assigned ? "SystemAssigned" : null
    }
  }

  dynamic "blob_properties" {
    for_each = var.blob_properties != null ? [var.blob_properties] : []
    content {

      versioning_enabled       = lookup(blob_properties.value, "versioning_enabled", null)
      change_feed_enabled      = lookup(blob_properties.value, "change_feed_enabled", null)
      last_access_time_enabled = lookup(blob_properties.value, "last_access_time_enabled", null)
      default_service_version  = lookup(blob_properties.value, "default_service_version", null)

      dynamic "delete_retention_policy" {
        for_each = lookup(blob_properties.value, "delete_retention_policy", null) != null ? [blob_properties.value.delete_retention_policy] : []
        content {
          days = delete_retention_policy.value.days
        }
      }

      dynamic "container_delete_retention_policy" {
        for_each = lookup(blob_properties.value, "container_delete_retention_policy", null) != null ? [blob_properties.value.container_delete_retention_policy] : []
        content {
          days = container_delete_retention_policy.value.days
        }
      }
    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules != null ? [var.network_rules] : []
    content {
      default_action             = lookup(network_rules.value, "default_action", "Deny")
      bypass                     = lookup(network_rules.value, "bypass", ["AzureServices"])
      ip_rules                   = lookup(network_rules.value, "ip_rules", [])
      virtual_network_subnet_ids = lookup(network_rules.value, "virtual_network_subnet_ids", [])
    }
  }

  tags = var.tags
}


resource "azurerm_storage_container" "containers" {
  for_each              = var.enable_containers ? var.containers : {}
  name                  = each.key
  storage_account_id    = azurerm_storage_account.StorgaeAccount.id
  container_access_type = each.value.access_type
}

resource "azurerm_storage_share" "file_shares" {
  for_each = var.enable_file_shares ? var.file_shares : {}

  name                 = each.key
  storage_account_id = azurerm_storage_account.StorgaeAccount.id
  quota                = each.value.quota
}
