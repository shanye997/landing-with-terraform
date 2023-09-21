variable "name" {
  default = "tf-exampleedgekubernetes-3698887"
}

variable "worker_disk_performance_level_var" {
  default = "PL1"
}

variable "password_var" {
  default = "Test12345"
}

variable "service_cidr_var" {
  default = "172.16.0.0/16"
}

variable "load_balancer_spec_var" {
  default = "slb.s2.small"
}

variable "worker_instance_charge_type_var" {
  default = "PostPaid"
}

variable "name_var" {
  default = "tf-exampleedgekubernetes-3698887"
}

variable "install_cloud_monitor_var" {
  default = "true"
}

variable "worker_number_var" {
  default = "2"
}

variable "new_nat_gateway_var" {
  default = "true"
}

variable "is_enterprise_security_group_var" {
  default = "true"
}

variable "version_var" {
  default = "1.20.11-aliyunedge.1"
}

variable "cluster_spec_var" {
  default = "ack.pro.small"
}

variable "pod_cidr_var" {
  default = "10.99.0.0/16"
}

variable "worker_disk_size_var" {
  default = "120"
}

variable "worker_disk_category_var" {
  default = "cloud_essd"
}

variable "deletion_protection_var" {
  default = "false"
}

variable "slb_internet_enabled_var" {
  default = "true"
}

variable "node_cidr_mask_var" {
  default = "24"
}

