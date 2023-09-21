resource "alicloud_oss_bucket" "default" {
  count  = 2
  bucket = join("", [var.name, count.index])
  acl    = "public-read-write"
}

resource "alicloud_log_project" "default" {
  count = 2
  name  = join("", [var.name, count.index])
}

resource "alicloud_oos_service_setting" "default" {
  delivery_oss_key_prefix   = var.delivery_oss_key_prefix_var
  delivery_sls_enabled      = var.delivery_sls_enabled_var
  delivery_sls_project_name = alicloud_log_project.default.0.name
  delivery_oss_bucket_name  = alicloud_oss_bucket.default.0.bucket
  delivery_oss_enabled      = var.delivery_oss_enabled_var
}
