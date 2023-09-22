variable "name" {
  default = "tf-exampleKubernetes_basic-3898635"
}

variable "install_cloud_monitor_var" {
  default = "true"
}

variable "password_var" {
  default = "Yourpassword1234"
}

variable "pod_cidr_var" {
  default = "10.72.0.0/16"
}

variable "name_var" {
  default = "tf-dedicated-k8s"
}

variable "master_disk_category_var" {
  default = "cloud_ssd"
}

variable "deletion_protection_var" {
  default = "false"
}

variable "enable_ssh_var" {
  default = "true"
}

variable "proxy_mode_var" {
  default = "ipvs"
}

variable "new_nat_gateway_var" {
  default = "true"
}

variable "service_cidr_var" {
  default = "172.18.0.0/16"
}

