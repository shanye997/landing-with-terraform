variable "name" {
  default = "tf-examplePolarDBClusterCreate"
}

variable "db_node_count_var" {
  default = "2"
}

variable "scale_max_var" {
  default = "3"
}

variable "scale_min_var" {
  default = "2"
}

variable "backup_retention_policy_on_cluster_deletion_var" {
  default = "NONE"
}

variable "loose_polar_log_bin_var" {
  default = "ON"
}

variable "allow_shut_down_var" {
  default = "true"
}

variable "renewal_status_var" {
  default = "AutoRenewal"
}

variable "lower_case_table_names_var" {
  default = "1"
}

variable "default_time_zone_var" {
  default = "+1:00"
}

variable "auto_renew_period_var" {
  default = "2"
}

variable "period_var" {
  default = "1"
}

variable "pay_type_var" {
  default = "PostPaid"
}

variable "scale_ro_num_min_var" {
  default = "2"
}

variable "clone_data_point_var" {
  default = "LATEST"
}

variable "seconds_until_auto_pause_var" {
  default = "3660"
}

variable "db_node_num_var" {
  default = "2"
}

variable "creation_option_var" {
  default = "CloneFromPolarDB"
}

variable "scale_ro_num_max_var" {
  default = "3"
}

