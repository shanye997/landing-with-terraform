resource "alicloud_oss_bucket" "bucket_src" {
  bucket = "${var.name}-1"
}

resource "alicloud_oss_bucket" "bucket_dest" {
  bucket = "${var.name}-2"
}

resource "alicloud_kms_key" "key" {
  description            = "Hello KMS"
  pending_window_in_days = "7"
  status                 = "Enabled"
}

locals {
  bucket_src  = alicloud_oss_bucket.bucket_src.id
  bucket_dest = alicloud_oss_bucket.bucket_dest.id
  location    = alicloud_oss_bucket.bucket_dest.location
  kms_key_id  = alicloud_kms_key.key.id
}

resource "alicloud_oss_bucket_replication" "default" {
  prefix_set {
    prefixes = [
      "1230",
      "456",
      "789"
    ]
  }

  encryption_configuration {
    replica_kms_key_id = local.kms_key_id
  }

  destination {
    bucket   = local.bucket_dest
    location = local.location
  }

  bucket = local.bucket_src
}
