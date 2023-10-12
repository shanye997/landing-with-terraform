variable "data_node_spec_var" {
  default = "elasticsearch.sn1ne.large"
}

variable "data_node_disk_size_var" {
  default = "20"
}

variable "data_node_disk_performance_level_var" {
  default = "PL1"
}

variable "master_node_disk_type_var" {
  default = "cloud_essd"
}

variable "instance_charge_type_var" {
  default = "PostPaid"
}

variable "master_node_spec_var" {
  default = "elasticsearch.sn1ne.large"
}

variable "password_var" {
  default = "Yourpassword1234"
}

variable "data_node_amount_var" {
  default = "4"
}

variable "data_node_disk_type_var" {
  default = "cloud_essd"
}

variable "description_var" {
  default = "tf-exampleEScn-hangzhou4563653"
}

