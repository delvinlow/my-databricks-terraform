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

data "azurerm_monitor_diagnostic_categories" "adb_diagnostic_categories" {
  resource_id = module.databricks_workspace.resource_id
}

module "databricks_audit_logs_diagnostic_setting" {
  source = "../../modules/diagnostic-setting"

  diagnostic_setting_name    = "${module.databricks_workspace.workspace_name}-diagnostic-setting"
  target_resource_id         = module.databricks_workspace.resource_id
  log_analytics_workspace_id = module.databricks_audit_logs_analytics_workspace.id

  logs_to_include         = data.azurerm_monitor_diagnostic_categories.adb_diagnostic_categories.logs
  logs_to_exclude         = []
}