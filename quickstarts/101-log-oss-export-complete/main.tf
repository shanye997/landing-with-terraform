resource "alicloud_log_oss_export" "default" {
  time_zone            = var.time_zone_var
  bucket               = var.bucket_var
  csv_config_null      = var.csv_config_null_var
  csv_config_delimiter = var.csv_config_delimiter_var
  suffix               = var.suffix_var
  display_name         = var.display_name_var
  json_enable_tag      = var.json_enable_tag_var
  prefix               = var.prefix_var
  config_columns {
    name = "name1"
    type = "string"
  }
  config_columns {
    name = "name2"
    type = "int64"
  }

  role_arn          = var.role_arn_var
  buffer_interval   = var.buffer_interval_var
  csv_config_header = var.csv_config_header_var
  csv_config_quote  = var.csv_config_quote_var
  compress_type     = var.compress_type_var
  project_name      = "tf-example-208982"
  export_name       = "test_oss_export"
  path_format       = var.path_format_var
  content_type      = var.content_type_var
  logstore_name     = "tf-example-208982"
  log_read_role_arn = var.log_read_role_arn_var
  buffer_size       = var.buffer_size_var
  csv_config_columns = [
    "aini",
    "aliyun"
  ]
  csv_config_linefeed = var.csv_config_linefeed_var
  csv_config_escape   = var.csv_config_escape_var
}
