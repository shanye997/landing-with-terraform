variable "name" {
  default = "tf-example5450"
}

variable "domain_name" {
  default = ""
}

variable "monitor_extend_info_var" {
  default = "{\\\"failureRate\\\":50,\\\"port\\\":80}"
}

variable "protocol_type_var" {
  default = "TCP"
}

variable "timeout_var" {
  default = "5000"
}

variable "evaluation_count_var" {
  default = "1"
}

variable "interval_var" {
  default = "60"
}

