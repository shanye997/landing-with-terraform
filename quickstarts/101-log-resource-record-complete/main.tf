resource "alicloud_log_resource_record" "default" {
  record_id     = "tf-examplelog-resource-record-6164202"
  resource_name = var.resource_name_var
  tag           = var.tag_var
  value         = var.value_var
}
