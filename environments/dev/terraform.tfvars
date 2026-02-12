resource_group_name               = "bnlwe-CC01-PA03-rg"
storage_account_name              = "bnlwestgunilever"
location                          = "West Europe"
account_tier                      = "Standard"
account_replication_type          = "GRS"
account_kind                      = "StorageV2"
access_tier                       = "Hot"
enable_containers                 = true
public_network_access_enabled     = false #true or false
shared_access_key_enabled         = true
infrastructure_encryption_enabled = true
enable_file_shares                = true
is_hns_enabled                    = false
min_tls_version                   = "TLS1_2"
allow_nested_items_to_be_public   = false
large_file_share_enabled          = false
nfsv3_enabled                     = false
https_traffic_only_enabled        = true
local_user_enabled                = false

file_shares = {
  "backend-fileshares" = {
    quota = 1
  }
  "front-fileshares" = {
    quota = 2
  }
}

blob_properties = {
  versioning_enabled       = true
  change_feed_enabled      = true
  last_access_time_enabled = true
  default_service_version  = "2020-06-12"
  container_delete_retention_policy = {
    days = 7
  }
  delete_retention_policy = {
    days = 30
  }
}

## network rules
network_rules = {
  default_action             = "allow" # "allow" or "deny"
  bypass                     = ["AzureServices"]
  ip_rules                   = []
  virtual_network_subnet_ids = []
}

managed_identities = {
  system_assigned            = true
  user_assigned_resource_ids = []
}

containers = {
  "data" = {
    access_type = "private"
  },
  "backups" = {
    access_type = "private"
  },
  "public" = {
    access_type = "private"
  }
}

tags = {
  Environment  = "Dev"
  Managed_By   = "platform-team"
  ProductName  = "cih"
  ProductGroup = "product-factory"


}

