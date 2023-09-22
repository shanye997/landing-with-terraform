variable "name" {
  default = "tf-examplecn-hangzhouAlicloudEciContainerGroup3704"
}

variable "eip_bandwidth_var" {
  default = "5"
}

variable "insecure_registry_var" {
  default = "harbor.pre.com,192.168.1.1:5000,reg.test.com:80"
}

variable "memory_var" {
  default = "4"
}

variable "cpu_var" {
  default = "2"
}

variable "auto_create_eip_var" {
  default = "true"
}

variable "restart_policy_var" {
  default = "OnFailure"
}

variable "plain_http_registry_var" {
  default = "harbor.pre.com,192.168.1.1:5000,reg.test.com:80"
}

variable "auto_match_image_cache_var" {
  default = "true"
}

