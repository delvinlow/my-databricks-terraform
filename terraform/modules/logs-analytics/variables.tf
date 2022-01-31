variable "resource_group" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "logs_analytics_workspace_name" {
  type = string
}

variable "logs_analytics_workspace_sku" {
  type = number
}

variable "log_retention_days" {
  type = number
}
