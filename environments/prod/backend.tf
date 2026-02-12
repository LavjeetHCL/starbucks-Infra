#Terraform configuration for prod environment
terraform {
  # Backend configuration (commented out for testing)
  backend "azurerm" {
    resource_group_name  = "backend-prod"
    storage_account_name = "backendstgukprod"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
