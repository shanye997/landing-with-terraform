resource "alicloud_oss_bucket" "default" {
  server_side_encryption_rule {
    kms_master_key_id = "kms-id"
    sse_algorithm     = "KMS"
  }

  bucket = "tf-example-bucket-1757554"
}
