variable "name" {
  default = "tf-examplecn-hangzhoufcv2function21340"
}

variable "instance_type_var" {
  default = "fc.gpu.tesla.1"
}

variable "description_var" {
  default = "terraform测试case"
}

variable "disk_size_var" {
  default = "512"
}

variable "runtime_var" {
  default = "custom-container"
}

variable "timeout_var" {
  default = "60"
}

variable "gpu_memory_size_var" {
  default = "4096"
}

variable "handler_var" {
  default = "index.handler"
}

variable "code_checksum_var" {
  default = "1750949844529959033"
}

variable "ca_port_var" {
  default = "9000"
}

variable "initializer_var" {
  default = "index.initializer"
}

variable "cpu_var" {
  default = "2"
}

variable "instance_concurrency_var" {
  default = "10"
}

variable "initialization_timeout_var" {
  default = "10"
}

variable "memory_size_var" {
  default = "8192"
}

