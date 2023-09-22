variable "name" {
  default = "tf-examplemanagedkubernetes-4214926"
}

variable "name_var" {
  default = "tf-examplemanagedkubernetes-4214926"
}

variable "service_cidr_var" {
  default = "172.24.0.0/16"
}

variable "new_nat_gateway_var" {
  default = "true"
}

variable "pod_cidr_var" {
  default = "10.96.0.0/16"
}

variable "cluster_spec_var" {
  default = "ack.pro.small"
}

variable "slb_internet_enabled_var" {
  default = "true"
}

variable "enable_rrsa_var" {
  default = "true"
}

variable "proxy_mode_var" {
  default = "ipvs"
}

variable "version_var" {
  default = "1.22.3-aliyun.1"
}

variable "deletion_protection_var" {
  default = "false"
}

variable "is_enterprise_security_group_var" {
  default = "true"
}

variable "node_cidr_mask_var" {
  default = "26"
}

