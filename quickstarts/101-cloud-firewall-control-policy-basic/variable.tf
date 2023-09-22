variable "destination_var" {
  default = "100.1.1.0/24"
}

variable "source_var" {
  default = "1.2.3.0/24"
}

variable "application_name_var" {
  default = "ANY"
}

variable "description_var" {
  default = "放行所有流量"
}

variable "source_type_var" {
  default = "net"
}

variable "proto_var" {
  default = "ANY"
}

variable "acl_action_var" {
  default = "accept"
}

variable "destination_type_var" {
  default = "net"
}

