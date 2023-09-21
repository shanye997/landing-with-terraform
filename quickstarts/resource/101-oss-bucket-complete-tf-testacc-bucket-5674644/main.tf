resource "alicloud_oss_bucket" "default" {
  transfer_acceleration {
    enabled = "false"
  }

  bucket = "tf-example-bucket-5674644"
}
