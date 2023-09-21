resource "alicloud_oss_bucket" "default" {
  bucket        = "${var.name}"
  acl           = "private"
  force_destroy = true
  versioning {
    status = "Enabled"
  }
}

resource "alicloud_oss_bucket_object" "default" {
  bucket              = "${alicloud_oss_bucket.default.bucket}"
  key                 = "tf-sample/${var.name}-object"
  content             = "sample content"
  content_type        = "text/plain"
  cache_control       = "max-age=0"
  content_disposition = "attachment; filename=\"my-object\""
  content_encoding    = "gzip"
  expires             = "Wed, 06 May 2020 00:00:00 GMT"
}

data "alicloud_oss_bucket_objects" "default" {
  bucket_name = alicloud_oss_bucket_object.default.bucket
}
