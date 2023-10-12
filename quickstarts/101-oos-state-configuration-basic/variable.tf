variable "schedule_type_var" {
  default = "rate"
}

variable "schedule_expression_var" {
  default = "1 hour"
}

variable "targets_var" {
  default = "{\\\"Filters\\\": [{\\\"Type\\\": \\\"All\\\", \\\"Parameters\\\": {\\\"InstanceChargeType\\\": \\\"PrePaid\\\"}}], \\\"ResourceType\\\": \\\"ALIYUN::ECS::Instance\\\"}"
}

