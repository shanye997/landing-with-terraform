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
  name                  = "tf-example-log-store-3287983${count.index}"
  count                 = "5"
  retention_period      = var.retention_period_var
  append_meta           = var.append_meta_var
  max_split_shard_count = var.max_split_shard_count_var
  project               = alicloud_log_project.foo.name
  shard_count           = var.shard_count_var
  encrypt_conf {
    enable       = "true"
    encrypt_type = "default"
    user_cmk_info {
      arn        = "acs:ram::${data.alicloud_account.default.id}:role/aliyunlogdefaultrole"
      cmk_key_id = alicloud_kms_key.key.id
      region_id  = "cn-hangzhou"
    }

  }

  mode                = var.mode_var
  enable_web_tracking = var.enable_web_tracking_var
  auto_split          = var.auto_split_var
  hot_ttl             = var.hot_ttl_var
}
