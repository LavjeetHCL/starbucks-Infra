#Terraform configuration for QA environment
terraform {
  # Backend configuration (commented out for testing)
  backend "azurerm" {
    resource_group_name  = "backend-qa"
    storage_account_name = "backendstgukqa"
    container_name       = "tfstate"
    key                  = "qa.terraform.tfstate"
  }
}
