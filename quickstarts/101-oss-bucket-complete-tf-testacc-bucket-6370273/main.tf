resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-bucket-6370273"
  lifecycle_rule {
    prefix = "path1/"
    transitions {
      days          = "3"
      storage_class = "IA"
    }

    enabled = "true"
    filter {
      not {
        tag {
          key   = "key2"
          value = "value2"
        }

        prefix = "path1/sub1"
      }

      object_size_greater_than = "2"
      object_size_less_than    = "4"
    }

    id = "rule1"
  }

  acl = var.acl_var
}
