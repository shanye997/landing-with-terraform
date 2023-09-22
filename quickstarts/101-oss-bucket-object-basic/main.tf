resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-object-4291"
}

resource "alicloud_oss_bucket_object" "default" {
  key    = "test-object-source-key"
  bucket = alicloud_oss_bucket.default.bucket
}
