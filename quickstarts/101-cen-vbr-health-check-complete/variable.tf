variable "name" {
  default = "tf-exampleCenVbrHealthCheck1100"
}

variable "health_check_interval_var" {
  default = "2"
}

variable "health_check_source_ip_var" {
  default = "192.168.1.2"
}

variable "health_check_target_ip_var" {
  default = "10.0.0.2"
}

variable "healthy_threshold_var" {
  default = "8"
}

