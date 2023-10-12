resource "alicloud_log_oss_export" "default" {
  content_type    = var.content_type_var
  buffer_size     = var.buffer_size_var
  buffer_interval = var.buffer_interval_var
  export_name     = "test_oss_export"
  path_format     = var.path_format_var
  logstore_name   = "tf-example-208982"
  bucket          = var.bucket_var
  project_name    = "tf-example-208982"
  time_zone       = var.time_zone_var
  config_columns {
    name = "name1"
    type = "string"
  }
  config_columns {
    name = "name2"
    type = "int64"
  }

}
