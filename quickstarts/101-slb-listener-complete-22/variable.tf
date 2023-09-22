variable "ip_version" {
  default = "ipv4"
}

variable "name" {
  default = "tf-exampleSlbListenerConfigSpot1906"
}

variable "bandwidth_var" {
  default = "10"
}

variable "description_var" {
  default = "tf-exampleSlbListenerConfigSpot1906"
}

variable "unhealthy_threshold_var" {
  default = "9"
}

variable "server_group_id_var" {
  default = ""
}

variable "health_check_uri_var" {
  default = "/cn"
}

variable "proxy_protocol_v2_enabled_var" {
  default = "false"
}

variable "acl_status_var" {
  default = "on"
}

variable "health_check_connect_port_var" {
  default = "30"
}

variable "health_check_interval_var" {
  default = "4"
}

variable "scheduler_var" {
  default = "wrr"
}

variable "health_check_type_var" {
  default = "tcp"
}

variable "acl_type_var" {
  default = "black"
}

variable "established_timeout_var" {
  default = "500"
}

variable "persistence_timeout_var" {
  default = "3000"
}

variable "health_check_http_code_var" {
  default = "http_2xx,http_3xx"
}

variable "healthy_threshold_var" {
  default = "9"
}

variable "health_check_domain_var" {
  default = ""
}

variable "health_check_timeout_var" {
  default = "9"
}

