resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.logs_analytics_workspace_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group
  sku                 = var.logs_analytics_workspace_sku
  retention_in_days   = var.log_retention_days
}