data "alicloud_ros_regions" "default" {}

resource "alicloud_ros_stack_group" "default" {
  stack_group_name = var.name
  template_body    = "{\"ROSTemplateFormatVersion\":\"2015-09-01\", \"Parameters\": {\"VpcName\": {\"Type\": \"String\"},\"InstanceType\": {\"Type\": \"String\"}}}"
  description      = "test for stack groups"
  parameters {
    parameter_key   = "VpcName"
    parameter_value = "VpcName"
  }
  parameters {
    parameter_key   = "InstanceType"
    parameter_value = "InstanceType"
  }
}

resource "alicloud_ros_stack_instance" "default" {
  retain_stacks             = var.retain_stacks_var
  stack_group_name          = alicloud_ros_stack_group.default.stack_group_name
  stack_instance_account_id = var.account_id
  stack_instance_region_id  = data.alicloud_ros_regions.default.regions.0.region_id
  timeout_in_minutes        = var.timeout_in_minutes_var
  operation_description     = var.operation_description_var
  operation_preferences     = var.operation_preferences_var
  parameter_overrides {
    parameter_key   = "VpcName"
    parameter_value = "VpcName"
  }
  parameter_overrides {
    parameter_key   = "InstanceType"
    parameter_value = "InstanceType"
  }

}
