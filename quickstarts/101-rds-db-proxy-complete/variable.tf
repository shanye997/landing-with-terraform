variable "name" {
  default = "tf-exampleDBProxysc3t9"
}

variable "upgrade_time_var" {
  default = "Immediate"
}

variable "read_only_instance_distribution_type_var" {
  default = "Custom"
}

variable "db_proxy_ssl_enabled_var" {
  default = "Open"
}

variable "read_only_instance_max_delay_time_var" {
  default = "90"
}

variable "db_proxy_features_var" {
  default = "TransactionReadSqlRouteOptimizeStatus:1;ConnectionPersist:1;ReadWriteSpliting:1"
}

variable "db_proxy_connection_prefix_var" {
  default = "tf-examplesc3t9"
}

variable "db_proxy_instance_num_var" {
  default = "3"
}

variable "db_proxy_endpoint_read_write_mode_var" {
  default = "ReadWrite"
}

variable "db_proxy_connect_string_port_var" {
  default = "3306"
}

variable "effective_time_var" {
  default = "Immediate"
}

