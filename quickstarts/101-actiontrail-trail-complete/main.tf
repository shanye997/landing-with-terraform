resource "alicloud_oss_bucket" "default" {
  bucket = "${var.name}"
}

data "alicloud_ram_roles" "default" {
  name_regex = "AliyunActionTrailDefaultRole"
}

resource "alicloud_actiontrail_trail" "default" {
  oss_write_role_arn = data.alicloud_ram_roles.default.roles.0.arn
  status             = var.status_var
  trail_name         = "tf-exampleactiontrail8453216"
  trail_region       = var.trail_region_var
  event_rw           = var.event_rw_var
  oss_bucket_name    = alicloud_oss_bucket.default.id
}
