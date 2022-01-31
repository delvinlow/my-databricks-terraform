resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                       = var.diagnostic_setting_name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "log" {
    for_each = var.logs_to_include

    content {
      category = log.value

      retention_policy {
        enabled = true
        days    = var.retention_in_days
      }
    }
  }

  dynamic "log" {
    for_each = var.logs_to_exclude

    content {
      category = log.value
      enabled  = false

      retention_policy {
        enabled = false
        days    = 0
      }
    }
  }
}