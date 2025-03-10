#Ideally we would provide subscription ID per environment that would require three separate folder spaces 
provider "azurerm" {
    subscription_id = " "
  features {}
}

# Root-Level Resource: Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.environments[var.selected_env].resource_group_name
  location = var.environments[var.selected_env].location
}

# Nested Resource: Storage Accounts (Multiple per Environment)
resource "azurerm_storage_account" "sa" {
  count                    = length(var.environments[var.selected_env].storage_accounts)
  name                     = var.environments[var.selected_env].storage_accounts[count.index].name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.environments[var.selected_env].storage_accounts[count.index].account_tier
  account_replication_type = var.environments[var.selected_env].storage_accounts[count.index].replication

  tags = {
    costcentre =  var.environments[var.selected_env].storage_accounts[count.index].costcentre
    productname =  var.environments[var.selected_env].storage_accounts[count.index].productname
  }
  lifecycle {
    prevent_destroy = true
   }
  }
