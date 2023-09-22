resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-bucket-5109717"
  lifecycle_rule {
    transitions {
      days          = "3"
      storage_class = "IA"
    }
    transitions {
      days          = "30"
      storage_class = "DeepColdArchive"
    }

    enabled = "true"
    id      = "rule3"
    prefix  = "path3/"
  }
  lifecycle_rule {
    noncurrent_version_transition {
      storage_class = "DeepColdArchive"
      days          = "5"
    }

    prefix  = "path4/"
    enabled = "true"
    id      = "rule4"
  }

  storage_class = "DeepColdArchive"
  versioning {
    status = "Enabled"
  }

  acl = var.acl_var
}
