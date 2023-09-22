variable "ip_version" {
  default = "ipv4"
}

variable "name" {
  default = "tf-exampleSlbListenerConfigSpot2029"
}

variable "health_check_connect_port_var" {
  default = "30"
}

variable "healthy_threshold_var" {
  default = "9"
}

variable "acl_status_var" {
  default = "on"
}

variable "persistence_timeout_var" {
  default = "3000"
}

variable "health_check_interval_var" {
  default = "5"
}

variable "bandwidth_var" {
  default = "15"
}

variable "unhealthy_threshold_var" {
  default = "9"
}

variable "health_check_timeout_var" {
  default = "9"
}

variable "proxy_protocol_v2_enabled_var" {
  default = "false"
}

variable "description_var" {
  default = "tf-exampleSlbListenerConfigSpot2029"
}

variable "acl_type_var" {
  default = "black"
}

variable "scheduler_var" {
  default = "wrr"
}

