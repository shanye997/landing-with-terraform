resource "alicloud_oss_bucket" "default" {
  lifecycle_rule {
    enabled = "true"
    id      = "rule1"
    prefix  = "path1/"
    tags = {

    }
    transitions {
      days          = "3"
      storage_class = "IA"
    }

  }
  lifecycle_rule {
    prefix = "path2/"
    transitions {
      days          = "30"
      storage_class = "IA"
    }

    enabled = "true"
    id      = "rule2"
  }

  acl    = var.acl_var
  bucket = "tf-example-bucket-4368698"
}
