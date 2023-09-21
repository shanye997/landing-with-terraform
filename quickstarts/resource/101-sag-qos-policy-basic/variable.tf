variable "name" {
  default = "tf-testQosPolicy2023-09-22"
}

variable "priority_var" {
  default = "1"
}

variable "source_port_range_var" {
  default = "-1/-1"
}

variable "dest_cidr_var" {
  default = "10.10.0.0/24"
}

variable "dest_port_range_var" {
  default = "-1/-1"
}

variable "source_cidr_var" {
  default = "192.168.0.0/24"
}

variable "ip_protocol_var" {
  default = "ALL"
}

