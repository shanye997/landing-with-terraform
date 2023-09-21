resource "alicloud_ros_stack_group" "default" {
  stack_group_name = "tf-exampleRosStackGroups2896546"
  template_body    = "{\"ROSTemplateFormatVersion\":\"2015-09-01\"}"
  description      = "test for stack groups"
}

data "alicloud_ros_stack_groups" "default" {
  ids = [
    "${alicloud_ros_stack_group.default.id}-fake"
  ]
  name_regex     = "${alicloud_ros_stack_group.default.stack_group_name}-fake"
  status         = "DELETED"
  enable_details = var.enable_details_var
}
