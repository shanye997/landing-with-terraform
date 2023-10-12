resource "alicloud_oss_bucket" "default" {
  lifecycle_rule_allow_same_action_overlap = true
  acl                                      = var.acl_var
  bucket                                   = "tf-example-bucket-4199035"
  lifecycle_rule {
    enabled = "true"
    id      = "rule1"
    prefix  = "path3/"
    transitions {
      days          = "3"
      storage_class = "IA"
    }

  }
  lifecycle_rule {
    id     = "rule2"
    prefix = "path3/abc"
    transitions {
      days          = "30"
      storage_class = "IA"
    }

    enabled = "true"
  }

}
