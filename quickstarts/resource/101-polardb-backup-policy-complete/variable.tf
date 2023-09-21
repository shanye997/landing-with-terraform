variable "name" {
  default = "tf-examplePolarDBNewBackupPolicy"
}

variable "data_level1_backup_frequency_var" {
  default = "Normal"
}

variable "log_backup_another_region_region_var" {
  default = "cn-beijing"
}

variable "data_level2_backup_another_region_region_var" {
  default = "cn-beijing"
}

variable "data_level1_backup_retention_period_var" {
  default = "7"
}

variable "log_backup_retention_period_var" {
  default = "4"
}

variable "backup_frequency_var" {
  default = "Normal"
}

variable "backup_retention_policy_on_cluster_deletion_var" {
  default = "LATEST"
}

variable "log_backup_another_region_retention_period_var" {
  default = "32"
}

variable "data_level2_backup_another_region_retention_period_var" {
  default = "30"
}

variable "data_level2_backup_retention_period_var" {
  default = "30"
}

variable "data_level1_backup_time_var" {
  default = "10:00Z-11:00Z"
}

variable "preferred_backup_time_var" {
  default = "10:00Z-11:00Z"
}

