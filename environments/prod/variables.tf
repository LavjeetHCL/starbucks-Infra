variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region location"
  type        = string
}

variable "account_kind" {
  description = "Kind of storage account"
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "Performance tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Type of replication for the storage account"
  type        = string
  default     = "LRS"
}

variable "access_tier" {
  description = "Access tier for the storage account"
  type        = string
  default     = "Hot"
}

variable "is_hns_enabled" {
  description = "Enable Hierarchical Namespace"
  type        = bool
  default     = false
}

variable "min_tls_version" {
  description = "Minimum TLS version"
  type        = string
  default     = "TLS1_2"
}

variable "public_network_access_enabled" {
  description = "Enable public network access"
  type        = bool
  default     = false
}

variable "infrastructure_encryption_enabled" {
  description = "Enable infrastructure encryption"
  type        = bool
  default     = false
}

variable "allow_nested_items_to_be_public" {
  description = "Allow nested items to be public"
  type        = bool
  default     = false
}

variable "large_file_share_enabled" {
  description = "Enable large file share"
  type        = bool
  default     = false
}

variable "nfsv3_enabled" {
  description = "Enable NFSv3"
  type        = bool
  default     = false
}

variable "https_traffic_only_enabled" {
  description = "Enable HTTPS traffic only"
  type        = bool
  default     = true
}

variable "blob_properties" {
  description = "Blob service properties configuration"
  type        = any
  default     = null
}

variable "network_rules" {
  description = "Network rules configuration"
  type        = any
  default     = null
}

variable "managed_identities" {
  description = "Managed identities configuration"
  type        = any
  default     = null
}

variable "enable_containers" {
  description = "Enable containers"
  type        = bool
  default     = false
}

variable "containers" {
  description = "Container configuration"
  type = map(object({
    access_type = optional(string, "private")
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to the storage account"
  type        = map(string)
  default     = {}
}

# File Share Configuration
variable "file_shares" {
  type = map(object({
    quota = number
  }))
  description = "File shares to create"
  default     = {}
}

variable "enable_file_shares" {
  type        = bool
  description = "Enable file share creation"
  default     = false
}

variable "local_user_enabled" {
  description = "Enable local user access"
  type        = bool
  default     = false
}

variable "shared_access_key_enabled" {
  type        = bool
  default     = true
  description = "Enable shared access keys for the storage account"
}
