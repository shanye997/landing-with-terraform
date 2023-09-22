resource "alicloud_oss_bucket" "bucket_src" {
  bucket = "${var.name}-1"
}

resource "alicloud_oss_bucket" "bucket_dest" {
  bucket = "${var.name}-2"
}

resource "alicloud_ram_role" "role" {
  name        = "${var.name}-ramrole"
  document    = <<EOF
		{
		  "Statement": [
			{
			  "Action": "sts:AssumeRole",
			  "Effect": "Allow",
			  "Principal": {
				"Service": [
				  "oss.aliyuncs.com"
				]
			  }
			}
		  ],
		  "Version": "1"
		}
	  	EOF
  description = "this is a test"
  force       = true
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
  role_name   = alicloud_ram_role.role.name
  kms_key_id  = alicloud_kms_key.key.id
}

resource "alicloud_oss_bucket_replication" "default" {
  source_selection_criteria {
    sse_kms_encrypted_objects {
      status = "Enabled"
    }

  }

  sync_role = local.role_name
  action    = "PUT,DELETE"
  bucket    = local.bucket_src
  destination {
    bucket   = local.bucket_dest
    location = local.location
  }

  encryption_configuration {
    replica_kms_key_id = local.kms_key_id
  }

  historical_object_replication = "enabled"
  prefix_set {
    prefixes = [
      "1230",
      "456",
      "789"
    ]
  }

}
