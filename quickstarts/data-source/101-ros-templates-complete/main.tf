resource "alicloud_ros_template" "default" {
  template_name = "tf-exampleRosTemplates7476203"
  template_body = "{\"ROSTemplateFormatVersion\":\"2015-09-01\"}"
  tags = {
    "Created" : "TF",
    "For" : "ROS",
  }
  description = "test for ros templates"
}

data "alicloud_ros_templates" "default" {
  name_regex = alicloud_ros_template.default.template_name
  ids = [
    alicloud_ros_template.default.id
  ]
  tags = {
    Created = "TF"
    For     = "ROS"
  }
  share_type     = "Shared"
  enable_details = var.enable_details_var
}
