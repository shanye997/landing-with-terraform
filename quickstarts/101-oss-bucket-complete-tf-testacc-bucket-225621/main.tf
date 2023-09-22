resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-bucket-225621"
  lifecycle_rule {
    prefix = "path3/"
    transitions {
      days          = "3"
      storage_class = "IA"
    }
    transitions {
      storage_class = "ColdArchive"
      days          = "30"
    }

    enabled = "true"
    id      = "rule3"
  }

  storage_class = "ColdArchive"
  acl           = var.acl_var
}
