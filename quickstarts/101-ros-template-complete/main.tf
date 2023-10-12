resource "alicloud_ros_template" "default" {
  template_body = var.template_body_var
  template_name = var.template_name_var
  description   = var.description_var
  tags = {
    Created = "TF"
    For     = "ROS"
  }
}
