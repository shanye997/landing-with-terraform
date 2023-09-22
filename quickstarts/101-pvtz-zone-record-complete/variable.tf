variable "type_var" {
  default = "A"
}

variable "value_var" {
  default = "2.2.2.$${count.index}"
}

variable "status_var" {
  default = "DISABLE"
}

variable "remark_var" {
  default = "pvtz_zone_remark"
}

variable "ttl_var" {
  default = "30"
}

variable "priority_var" {
  default = "2"
}

variable "rr_var" {
  default = "www"
}

