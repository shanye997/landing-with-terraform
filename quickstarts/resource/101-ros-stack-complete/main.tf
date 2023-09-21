resource "alicloud_ros_stack" "default" {
  timeout_in_minutes = var.timeout_in_minutes_var
  parameters {
    parameter_key   = "VpcName"
    parameter_value = "tf-example"
  }
  parameters {
    parameter_key   = "InstanceType"
    parameter_value = "ECS"
  }

  stack_name        = "tf-examplecn-hangzhouAlicloudRosStack42143"
  stack_policy_body = var.stack_policy_body_var
  tags = {
    Created = "TF"
    For     = "ROS"
  }
  template_body = var.template_body_var
}
