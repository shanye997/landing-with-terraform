variable "name" {
  default = "tf-exampleSlbRuleBasic"
}

variable "scheduler_var" {
  default = "rr"
}

variable "sticky_session_var" {
  default = "on"
}

variable "health_check_connect_port_var" {
  default = "80"
}

variable "listener_sync_var" {
  default = "off"
}

variable "unhealthy_threshold_var" {
  default = "3"
}

variable "health_check_timeout_var" {
  default = "10"
}

variable "healthy_threshold_var" {
  default = "3"
}

variable "health_check_var" {
  default = "on"
}

variable "health_check_domain_var" {
  default = "test"
}

variable "sticky_session_type_var" {
  default = "server"
}

variable "cookie_var" {
  default = "23ffsa"
}

variable "health_check_http_code_var" {
  default = "http_2xx"
}

variable "cookie_timeout_var" {
  default = "100"
}

variable "health_check_interval_var" {
  default = "10"
}

variable "health_check_uri_var" {
  default = "/test"
}

