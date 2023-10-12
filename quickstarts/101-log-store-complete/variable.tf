variable "name" {
  default = "tf-example-log-store-605179"
}

variable "max_split_shard_count_var" {
  default = "60"
}

variable "shard_count_var" {
  default = "1"
}

variable "mode_var" {
  default = "standard"
}

variable "enable_web_tracking_var" {
  default = "true"
}

variable "auto_split_var" {
  default = "true"
}

variable "hot_ttl_var" {
  default = "0"
}

variable "retention_period_var" {
  default = "30"
}

variable "append_meta_var" {
  default = "false"
}

