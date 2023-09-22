variable "schedule_type_var" {
  default = "rate"
}

variable "targets_var" {
  default = "{\\\"Filters\\\": [{\\\"Type\\\": \\\"All\\\", \\\"Parameters\\\": {\\\"InstanceChargeType\\\": \\\"PrePaid\\\"}}], \\\"ResourceType\\\": \\\"ALIYUN::ECS::Instance\\\"}"
}

variable "parameters_var" {
  default = "{\\\"policy\\\": {\\\"ACS:Application\\\": {\\\"Collection\\\": \\\"Enabled\\\"}}}"
}

variable "schedule_expression_var" {
  default = "1 hour"
}

variable "configure_mode_var" {
  default = "ApplyOnly"
}

variable "description_var" {
  default = "tf-examplecn-hangzhouoosstateconfiguration14384"
}

