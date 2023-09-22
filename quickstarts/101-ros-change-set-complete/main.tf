resource "alicloud_ros_change_set" "default" {
  stack_name      = "tf-exampleRosChangeSet1782847stack"
  template_body   = "{\"ROSTemplateFormatVersion\":\"2015-09-01\"}"
  change_set_name = "tf-exampleRosChangeSet1782847"
  change_set_type = "CREATE"
  description     = "Test From Terraform"
}
