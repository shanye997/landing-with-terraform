provider "alicloud" {
  assume_role {}
}

resource "alicloud_oss_bucket" "default" {
  bucket = "tf-examplecn-hangzhoubucket-6977"
}
