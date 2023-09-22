variable "name" {
  default = "tf-exampleDBbackuppolicy"
}

variable "local_log_retention_hours_var" {
  default = "48"
}

variable "archive_backup_keep_policy_var" {
  default = "ByWeek"
}

variable "enable_backup_log_var" {
  default = "true"
}

variable "backup_interval_var" {
  default = "60"
}

variable "preferred_backup_time_var" {
  default = "13:00Z-14:00Z"
}

variable "local_log_retention_space_var" {
  default = "35"
}

variable "archive_backup_keep_count_var" {
  default = "3"
}

variable "high_space_usage_protection_var" {
  default = "Enable"
}

variable "backup_retention_period_var" {
  default = "830"
}

variable "archive_backup_retention_period_var" {
  default = "100"
}

variable "category_var" {
  default = "Standard"
}

variable "released_keep_policy_var" {
  default = "Lastest"
}

variable "compress_type_var" {
  default = "1"
}

variable "log_backup_frequency_var" {
  default = "LogInterval"
}

variable "log_backup_retention_period_var" {
  default = "700"
}

