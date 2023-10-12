variable "name" {
  default = "tf-testQosPolicy2023-09-22"
}

variable "start_time_var" {
  default = "2023-09-22T00:00:00+0800"
}

variable "end_time_var" {
  default = "2023-09-22T12:00:00+0800"
}

variable "priority_var" {
  default = "1"
}

variable "ip_protocol_var" {
  default = "ALL"
}

variable "description_var" {
  default = "tf-testSagQosPolicyDescription"
}

variable "source_port_range_var" {
  default = "-1/-1"
}

variable "dest_cidr_var" {
  default = "10.10.0.0/24"
}

variable "name_var" {
  default = "tf-testSagQosPolicyName"
}

variable "dest_port_range_var" {
  default = "-1/-1"
}

variable "source_cidr_var" {
  default = "192.168.0.0/24"
}

