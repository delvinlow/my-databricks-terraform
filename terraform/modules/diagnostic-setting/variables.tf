variable "logs_to_include" {
  type        = list(string)
  description = "A list of diagnostic setting logs to include"
}

variable "logs_to_exclude" {
  type        = list(string)
  description = "A list of diagnostic setting logs to exclude"
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Id of log analytics workspace"
}

variable "target_resource_id" {
  type        = string
  description = "Id of the target resource on which to apply the diagnostic setting"
}

variable "diagnostic_setting_name" {
  type        = string
  description = "Name of the diagnostic settings"
}

variable "retention_in_days" {
  description = "Number of days the logs should be retained for"
  default     = 365
}
