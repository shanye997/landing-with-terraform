resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-object-4291"
}

resource "alicloud_oss_bucket_object" "default" {
  source                 = var.source_var
  bucket                 = alicloud_oss_bucket.default.bucket
  content_type           = var.content_type_var
  key                    = "test-object-source-key"
  server_side_encryption = var.server_side_encryption_var
}
