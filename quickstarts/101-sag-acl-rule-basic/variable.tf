variable "name" {
  default = "tf-testSagAclName"
}

variable "ip_protocol_var" {
  default = "ALL"
}

variable "direction_var" {
  default = "out"
}

variable "policy_var" {
  default = "drop"
}

variable "dest_port_range_var" {
  default = "-1/-1"
}

variable "dest_cidr_var" {
  default = "192.168.10.0/24"
}

variable "source_cidr_var" {
  default = "10.10.10.0/24"
}

variable "source_port_range_var" {
  default = "-1/-1"
}

