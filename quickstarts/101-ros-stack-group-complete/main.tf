resource "alicloud_ros_stack_group" "default" {
  description = var.description_var
  parameters {
    parameter_key   = "VpcName"
    parameter_value = "VpcName"
  }
  parameters {
    parameter_key   = "InstanceType"
    parameter_value = "InstanceType"
  }

  stack_group_name = "tf-examplecn-hangzhouAlicloudRosStackGroup50368"
  template_body    = var.template_body_var
}
