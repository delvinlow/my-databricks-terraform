
resource "azurerm_databricks_workspace" "databricks_workspace" {
  name                = var.databricks_workspace_name

  resource_group_name = var.databricks_workspace_resource_group
  location            = var.databricks_workspace_location
  sku                 = var.databricks_workspace_sku

  tags = {
    Environment = "Test"
  }
}

