resource "alicloud_ros_stack" "default" {
  stack_name = "tf-examplecn-hangzhouAlicloudRosStack42143"
  parameters {
    parameter_key   = "VpcName"
    parameter_value = "tf-example"
  }
  parameters {
    parameter_key   = "InstanceType"
    parameter_value = "ECS"
  }

}
