variable "name" {
  default = "tf-testSagAclName"
}

variable "source_cidr_var" {
  default = "10.10.10.0/24"
}

variable "dest_port_range_var" {
  default = "-1/-1"
}

variable "direction_var" {
  default = "out"
}

variable "priority_var" {
  default = "2"
}

variable "policy_var" {
  default = "drop"
}

variable "dest_cidr_var" {
  default = "192.168.10.0/24"
}

variable "description_var" {
  default = "tf-testSagAclRule"
}

variable "ip_protocol_var" {
  default = "ALL"
}

variable "source_port_range_var" {
  default = "-1/-1"
}

