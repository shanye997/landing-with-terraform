variable "name" {
  default = "terraform-example"
}

provider "alicloud" {
  region = "cn-hangzhou"
}

resource "alicloud_oss_bucket" "CreateBucket" {
  storage_class = "Standard"
  bucket        = var.name
}


resource "alicloud_oss_bucket_public_access_block" "default" {
  bucket              = alicloud_oss_bucket.CreateBucket.bucket
  block_public_access = true
}