resource "alicloud_log_resource" "default" {
  type        = var.type_var
  description = var.description_var
  ext_info    = var.ext_info_var
  name        = "tf_examplelog_resource_529806"
  schema      = var.schema_var
}
