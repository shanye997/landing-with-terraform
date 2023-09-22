variable "name" {
  default = "tf-exampleap-southeast-1smartagflowlog52897"
}

variable "sls_region_id_var" {
  default = "ap-southeast-1"
}

variable "netflow_server_ip_var" {
  default = "192.168.0.1"
}

variable "netflow_version_var" {
  default = "V10"
}

variable "active_aging_var" {
  default = "400"
}

variable "netflow_server_port_var" {
  default = "9999"
}

variable "status_var" {
  default = "Active"
}

variable "output_type_var" {
  default = "sls"
}

variable "inactive_aging_var" {
  default = "20"
}

