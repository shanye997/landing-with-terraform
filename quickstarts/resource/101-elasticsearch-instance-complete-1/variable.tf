variable "instance_charge_type_var" {
  default = "PostPaid"
}

variable "protocol_var" {
  default = "HTTP"
}

variable "enable_kibana_private_network_var" {
  default = "true"
}

variable "description_var" {
  default = "tf-exampleEScn-hangzhou3358700"
}

variable "password_var" {
  default = "Yourpassword1234"
}

variable "client_node_spec_var" {
  default = "elasticsearch.sn1ne.large"
}

variable "period_var" {
  default = "1"
}

variable "client_node_amount_var" {
  default = "2"
}

variable "renewal_duration_unit_var" {
  default = "M"
}

variable "data_node_disk_type_var" {
  default = "cloud_essd"
}

variable "master_node_disk_type_var" {
  default = "cloud_essd"
}

variable "renew_status_var" {
  default = "NotRenewal"
}

variable "auto_renew_duration_var" {
  default = "3"
}

variable "data_node_disk_performance_level_var" {
  default = "PL1"
}

variable "data_node_disk_size_var" {
  default = "20"
}

variable "kibana_node_spec_var" {
  default = "elasticsearch.sn1ne.large"
}

variable "data_node_amount_var" {
  default = "2"
}

variable "enable_public_var" {
  default = "true"
}

variable "data_node_spec_var" {
  default = "elasticsearch.sn1ne.large"
}

variable "master_node_spec_var" {
  default = "elasticsearch.sn1ne.large"
}

