variable "name" {
  default = "tf-examplePolarDBClusterUpdate"
}

variable "imci_switch_var" {
  default = "ON"
}

variable "modify_type_var" {
  default = "Upgrade"
}

variable "from_time_service_var" {
  default = "false"
}

variable "collector_status_var" {
  default = "Enable"
}

variable "upgrade_type_var" {
  default = "ALL"
}

variable "planned_end_time_var" {
  default = "2023-09-23T17:33:34Z"
}

variable "encrypt_new_tables_var" {
  default = "ON"
}

variable "description_var" {
  default = "tf-examplePolarDBClusterUpdate"
}

variable "db_node_count_var" {
  default = "2"
}

variable "role_arn_var" {
  default = "acs:ram::$${data.alicloud_account.current.id}:role/aliyunrdsinstanceencryptiondefaultrole"
}

variable "planned_start_time_var" {
  default = "2023-09-21T17:33:34Z"
}

variable "deletion_lock_var" {
  default = "1"
}

variable "pay_type_var" {
  default = "PostPaid"
}

variable "maintain_time_var" {
  default = "16:00Z-17:00Z"
}

variable "tde_status_var" {
  default = "Enabled"
}

variable "sub_category_var" {
  default = "Exclusive"
}

