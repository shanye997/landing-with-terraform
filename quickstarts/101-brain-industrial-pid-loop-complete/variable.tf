variable "pid_loop_type_var" {
  default = "0"
}

variable "pid_loop_configuration_var" {
  default = "{\\\"baseParam\\\":{\\\"forwardController\\\":false,\\\"integral\\\":false,\\\"kd\\\":{\\\"tagValue\\\":\\\"20\\\"},\\\"kp\\\":{},\\\"op\\\":\\\"PIDBenchmark.FOPDT_OP\\\",\\\"opParam\\\":{\\\"increment\\\":{\\\"max\\\":10},\\\"operate\\\":{\\\"max\\\":115,\\\"min\\\":-15},\\\"range\\\":{\\\"max\\\":115,\\\"min\\\":-15},\\\"trend\\\":0},\\\"openLoopTime\\\":150,\\\"pv\\\":\\\"PIDBenchmark.FOPDT_PV\\\",\\\"pvRange\\\":{\\\"max\\\":100,\\\"min\\\":0},\\\"sampleTime\\\":5,\\\"sp\\\":\\\"PIDBenchmark.FOPDT_SP\\\",\\\"spOperate\\\":{\\\"max\\\":100,\\\"min\\\":0},\\\"splitRangeControl\\\":false,\\\"suitCtrlTime\\\":100,\\\"td\\\":{},\\\"ti\\\":{}},\\\"identParam\\\":{\\\"delay\\\":10,\\\"modelType\\\":3},\\\"resetParam\\\":{\\\"ctrlMode\\\":0,\\\"ctrlStuc\\\":1}}"
}

variable "pid_loop_desc_var" {
  default = "Test For Terraform"
}

variable "pid_loop_is_crucial_var" {
  default = "false"
}

variable "pid_loop_name_var" {
  default = "tf-example71459"
}

