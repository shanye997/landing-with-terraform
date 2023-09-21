variable "ip_version" {
  default = "ipv4"
}

variable "name" {
  default = "tf-exampleSlbListenerForwardConfigSpot7418"
}

variable "health_check_interval_var" {
  default = "4"
}

variable "description_var" {
  default = "tf-exampleSlbListenerConfigSpot3216"
}

variable "bandwidth_var" {
  default = "15"
}

variable "acl_status_var" {
  default = "off"
}

variable "idle_timeout_var" {
  default = "40"
}

variable "health_check_timeout_var" {
  default = "9"
}

variable "request_timeout_var" {
  default = "90"
}

variable "healthy_threshold_var" {
  default = "9"
}

variable "unhealthy_threshold_var" {
  default = "9"
}

variable "gzip_var" {
  default = "false"
}

variable "scheduler_var" {
  default = "rr"
}

variable "acl_type_var" {
  default = "white"
}

variable "cookie_var" {
  default = "testslblistenercookie"
}

variable "health_check_var" {
  default = "off"
}

variable "health_check_http_code_var" {
  default = "http_2xx,http_3xx"
}

variable "sticky_session_type_var" {
  default = "server"
}

variable "health_check_uri_var" {
  default = "/con"
}

variable "health_check_domain_var" {
  default = "al.com"
}

variable "health_check_connect_port_var" {
  default = "30"
}

variable "health_check_method_var" {
  default = "get"
}

variable "sticky_session_var" {
  default = "on"
}

variable "cookie_timeout_var" {
  default = "80000"
}

