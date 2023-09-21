resource "alicloud_oss_bucket" "default" {
  bucket = "tf-exampleactiontrail-4919793"
}

resource "alicloud_actiontrail_trail" "default" {
  trail_name      = "tf-exampleactiontrail-4919793"
  oss_bucket_name = alicloud_oss_bucket.default.id
  status          = "Disable"
}

data "alicloud_actiontrail_trails" "default" {
  status = "Enable"
  ids = [
    alicloud_actiontrail_trail.default.id
  ]
  name_regex = "${alicloud_actiontrail_trail.default.id}-fake"
}
