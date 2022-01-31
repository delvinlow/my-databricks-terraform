output "workspace_url" {
  value = azurerm_databricks_workspace.databricks_workspace.workspace_url
}

output "workspace_id" {
  value = azurerm_databricks_workspace.databricks_workspace.workspace_id
}

output "resource_id" {
  value = azurerm_databricks_workspace.databricks_workspace.id
}

output "workspace_name" {
  value = var.databricks_workspace_name
}