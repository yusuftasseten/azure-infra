# backend.tf - Configure Azure Blob Storage as the remote state backend
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstateeb540f0d" # Replace with your actual storage account name
    container_name       = "tfstate"
    key                  = "azure-infra/dev/terraform.tfstate" # Path within the container
    use_azuread_auth     = true
    use_cli              = true # Use Azure CLI authentication for local development
  }
}