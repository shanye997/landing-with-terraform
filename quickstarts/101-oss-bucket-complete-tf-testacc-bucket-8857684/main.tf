resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-bucket-8857684"
  lifecycle_rule {
    enabled = "true"
    expiration {
      expired_object_delete_marker = "true"
    }

    id     = "rule1"
    prefix = "path1/"
  }
  lifecycle_rule {
    enabled = "true"
    id      = "rule2"
    noncurrent_version_expiration {
      days = "10"
    }

    noncurrent_version_transition {
      days          = "3"
      storage_class = "IA"
    }
    noncurrent_version_transition {
      days          = "5"
      storage_class = "Archive"
    }

    prefix = "path2/"
  }

  versioning {
    status = "Suspended"
  }

}
