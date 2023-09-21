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

data "alicloud_ros_regions" "default" {}

resource "alicloud_ros_stack_instance" "default" {
  stack_instance_account_id = ""
  stack_group_name          = alicloud_ros_stack_group.default.stack_group_name
  stack_instance_region_id  = data.alicloud_ros_regions.default.regions.0.region_id
  parameter_overrides {
    parameter_value = "VpcName"
    parameter_key   = "VpcName"
  }
}

data "alicloud_ros_stack_instances" "default" {
  enable_details = var.enable_details_var
  ids = [
    alicloud_ros_stack_instance.default.id
  ]
  stack_group_name          = alicloud_ros_stack_instance.default.stack_group_name
  stack_instance_account_id = "1234567890"
  stack_instance_region_id  = "${alicloud_ros_stack_instance.default.stack_instance_region_id}-fake"
  status                    = "OUTDATED"
}
