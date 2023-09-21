variable "ip_version" {
  default = "ipv4"
}

variable "name" {
  default = "tf-exampleSlbListenerConfigSpot412"
}

variable "healthy_threshold_var" {
  default = "9"
}

variable "acl_status_var" {
  default = "off"
}

variable "health_check_domain_var" {
  default = "internal-health-check"
}

variable "sticky_session_type_var" {
  default = "insert"
}

variable "health_check_http_code_var" {
  default = "http_2xx,http_3xx"
}

variable "health_check_interval_var" {
  default = "4"
}

variable "idle_timeout_var" {
  default = "40"
}

variable "sticky_session_var" {
  default = "on"
}

variable "tls_cipher_policy_var" {
  default = "tls_cipher_policy_1_1"
}

variable "health_check_connect_port_var" {
  default = "30"
}

variable "health_check_var" {
  default = "off"
}

variable "unhealthy_threshold_var" {
  default = "9"
}

variable "scheduler_var" {
  default = "wlc"
}

variable "bandwidth_var" {
  default = "15"
}

variable "cookie_timeout_var" {
  default = "80000"
}

variable "gzip_var" {
  default = "false"
}

variable "health_check_method_var" {
  default = "get"
}

variable "enable_http2_var" {
  default = "on"
}

variable "health_check_uri_var" {
  default = "/con"
}

variable "description_var" {
  default = "tf-exampleSlbListenerConfigSpot412"
}

variable "acl_type_var" {
  default = "white"
}

variable "request_timeout_var" {
  default = "90"
}

variable "cookie_var" {
  default = "testslblistenercookie"
}

variable "health_check_timeout_var" {
  default = "9"
}

