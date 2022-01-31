terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.93.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example_rg" {
  name     = "example-resource-group"
  location = "Southeast Asia"
}

module "databricks_workspace" {
  source = "../../modules/azure-databricks"

  databricks_workspace_name           = "test-adb-workspace"
  databricks_workspace_resource_group = azurerm_resource_group.example_rg.name
  databricks_workspace_location       = azurerm_resource_group.example_rg.location
  databricks_workspace_sku            = "premium"
}

module "databricks_audit_logs_analytics_workspace" {
  source = "../../modules/logs-analytics"

  logs_analytics_workspace_name = "test-logs-analytics-workspace"
  logs_analytics_workspace_sku  = "PerGB2018"
  log_retention_days            = 365
  resource_group                = azurerm_resource_group.example_rg.name
  resource_group_location       = azurerm_resource_group.example_rg.location
}