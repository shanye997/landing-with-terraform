resource "alicloud_ros_change_set" "default" {
  change_set_name = "tf-exampleRosChangeSets5741008"
  stack_name      = "tf-exampleRosChangeSets5741008stack"
  change_set_type = "CREATE"
  description     = "Test From Terraform"
  template_body   = "{\"ROSTemplateFormatVersion\":\"2015-09-01\"}"
}

data "alicloud_ros_change_sets" "default" {
  stack_id       = alicloud_ros_change_set.default.stack_id
  status         = "CREATE_IN_PROGRESS"
  enable_details = var.enable_details_var
  ids = [
    "${alicloud_ros_change_set.default.id}-fake"
  ]
  name_regex = "${alicloud_ros_change_set.default.change_set_name}-fake"
}
