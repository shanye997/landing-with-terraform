resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-bucket-4292802"
  acl    = var.acl_var
}
