resource "alicloud_ros_stack" "default" {
  stack_name        = "tf-exampleRosStacks3343183"
  template_body     = "{\"ROSTemplateFormatVersion\":\"2015-09-01\"}"
  stack_policy_body = "{\"Statement\": [{\"Action\": \"Update:Delete\", \"Resource\": \"*\", \"Effect\": \"Allow\", \"Principal\": \"*\"}]}"
  tags = {
    "Created" : "TF",
    "For" : "ROS",
  }
}

data "alicloud_ros_stacks" "default" {
  name_regex = "${alicloud_ros_stack.default.stack_name}-fake"
  status     = "CREATE_COMPLETE"
  ids = [
    alicloud_ros_stack.default.id
  ]
  tags = {
    Created = "TF"
    For     = "ROS"
  }
  enable_details = var.enable_details_var
}
