resource "alicloud_log_oss_shipper" "default" {
  logstore_name   = "test-log-oss-shipper-3898846"
  oss_bucket      = var.oss_bucket_var
  buffer_interval = var.buffer_interval_var
  project_name    = "test-log-oss-shipper-3898846"
  format          = var.format_var
  buffer_size     = var.buffer_size_var
  shipper_name    = "test_shipper"
  parquet_config {
    name = "name1"
    type = "string"
  }
  parquet_config {
    type = "int64"
    name = "name2"
  }

  path_format = var.path_format_var
}
