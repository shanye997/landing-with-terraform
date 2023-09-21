resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-bucket-3656500"
  lifecycle_rule {
    transitions {
      days                     = "3"
      is_access_time           = "true"
      return_to_std_when_visit = "false"
      storage_class            = "IA"
    }

    enabled = "true"
    id      = "rule1"
    prefix  = "path1/"
  }
  lifecycle_rule {
    transitions {
      days                     = "30"
      is_access_time           = "true"
      return_to_std_when_visit = "true"
      storage_class            = "IA"
    }

    enabled = "true"
    id      = "rule2"
    prefix  = "path2/"
  }
  lifecycle_rule {
    enabled = "true"
    expiration {
      expired_object_delete_marker = "true"
    }

    id     = "rule3"
    prefix = "path3/"
  }
  lifecycle_rule {
    id = "rule4"
    noncurrent_version_expiration {
      days = "10"
    }

    noncurrent_version_transition {
      storage_class            = "IA"
      days                     = "3"
      is_access_time           = "true"
      return_to_std_when_visit = "true"
    }
    noncurrent_version_transition {
      days          = "5"
      storage_class = "Archive"
    }

    prefix  = "path4/"
    enabled = "true"
  }

  versioning {
    status = "Enabled"
  }

  access_monitor {
    status = "Enabled"
  }

  acl = var.acl_var
}
