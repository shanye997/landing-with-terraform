variable "description_var" {
  default = "放行所有流量"
}

variable "dest_port_group_var" {
  default = ""
}

variable "proto_var" {
  default = "ANY"
}

variable "source_type_var" {
  default = "net"
}

variable "dest_port_type_var" {
  default = "port"
}

variable "release_var" {
  default = "true"
}

variable "acl_action_var" {
  default = "accept"
}

variable "application_name_var" {
  default = "ANY"
}

variable "destination_var" {
  default = "100.1.1.0/24"
}

variable "destination_type_var" {
  default = "net"
}

variable "source_var" {
  default = "1.2.3.0/24"
}

variable "dest_port_var" {
  default = "0/0"
}

