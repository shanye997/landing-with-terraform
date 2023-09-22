variable "stack_policy_body_var" {
  default = "{\\\"Statement\\\": [{\\\"Action\\\": \\\"Update:*\\\", \\\"Resource\\\": \\\"*\\\", \\\"Effect\\\": \\\"Allow\\\", \\\"Principal\\\": \\\"*\\\"}]}"
}

variable "template_body_var" {
  default = "{\\\"ROSTemplateFormatVersion\\\":\\\"2015-09-01\\\", \\\"Description\\\" : \\\"模板描述信息，可用于说明模板的适用场景、架构说明等。\\\", \\\"Parameters\\\": {\\\"VpcName\\\": {\\\"Type\\\": \\\"String\\\"},\\\"InstanceType\\\": {\\\"Type\\\": \\\"String\\\"}}}"
}

variable "timeout_in_minutes_var" {
  default = "60"
}

