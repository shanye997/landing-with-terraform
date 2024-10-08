resource "random_integer" "default" {
  max = 99999
  min = 10000
}

resource "alicloud_oss_bucket" "bucket-tags" {
  bucket = "terraform-example-${random_integer.default.result}"

  tags = {
    key1 = "value1"
    key2 = "value2"
  }
}

resource "alicloud_oss_bucket_acl" "bucket-tags" {
  bucket = alicloud_oss_bucket.bucket-tags.bucket
  acl    = "private"
}