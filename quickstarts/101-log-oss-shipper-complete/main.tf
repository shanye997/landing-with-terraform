resource "alicloud_log_oss_shipper" "default" {
  csv_config_header = var.csv_config_header_var
  oss_bucket        = var.oss_bucket_var
  parquet_config {
    type = "string"
    name = "name1"
  }
  parquet_config {
    name = "name2"
    type = "int64"
  }

  project_name              = "test-log-oss-shipper-3898846"
  buffer_size               = var.buffer_size_var
  csv_config_delimiter      = var.csv_config_delimiter_var
  json_enable_tag           = var.json_enable_tag_var
  logstore_name             = "test-log-oss-shipper-3898846"
  oss_prefix                = var.oss_prefix_var
  path_format               = var.path_format_var
  shipper_name              = "test_shipper"
  csv_config_nullidentifier = var.csv_config_nullidentifier_var
  compress_type             = var.compress_type_var
  csv_config_linefeed       = var.csv_config_linefeed_var
  csv_config_columns = [
    "aini",
    "aliyun"
  ]
  format           = var.format_var
  buffer_interval  = var.buffer_interval_var
  csv_config_quote = var.csv_config_quote_var
}
