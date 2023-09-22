variable "vpc_auth_mode_var" {
  default = "Open"
}

variable "engine_version_var" {
  default = "6.0"
}

variable "instance_class_var" {
  default = "redis.shard.mid.ce"
}

variable "backup_time_var" {
  default = "10:00Z-11:00Z"
}

variable "maintain_end_time_var" {
  default = "03:00Z"
}

variable "private_connection_port_var" {
  default = "4010"
}

variable "db_instance_name_var" {
  default = "tf-exampleKvstoreRedisInstance6_0-1568192"
}

variable "tde_status_var" {
  default = "Enabled"
}

variable "private_connection_prefix_var" {
  default = "privateprefix1568192"
}

variable "period_var" {
  default = "1"
}

variable "payment_type_var" {
  default = "PrePaid"
}

variable "auto_renew_var" {
  default = "false"
}

variable "instance_release_protection_var" {
  default = "true"
}

variable "auto_renew_period_var" {
  default = "2"
}

variable "maintain_start_time_var" {
  default = "02:00Z"
}

