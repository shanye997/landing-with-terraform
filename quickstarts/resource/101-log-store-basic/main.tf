data "alicloud_account" "default" {
}

resource "alicloud_kms_key" "key" {
  description            = "${var.name}"
  pending_window_in_days = "7"
  status                 = "Enabled"
}

resource "alicloud_log_project" "foo" {
  name        = "${var.name}"
  description = "tf unit test"
}

resource "alicloud_log_store" "default" {
  encrypt_conf {
    encrypt_type = "default"
    user_cmk_info {
      cmk_key_id = alicloud_kms_key.key.id
      region_id  = "cn-hangzhou"
      arn        = "acs:ram::${data.alicloud_account.default.id}:role/aliyunlogdefaultrole"
    }

    enable = "true"
  }

  project = alicloud_log_project.foo.name
  count   = "5"
  name    = "tf-example-log-store-3287983${count.index}"
}
