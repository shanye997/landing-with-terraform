resource "alicloud_kms_key" "default" {
  description            = "tf_exampleKmsKeysDataSource_8490003"
  pending_window_in_days = 7
}

data "alicloud_kms_keys" "default" {
  status            = "Enabled"
  description_regex = "^${alicloud_kms_key.default.description}-fake"
  ids = [
    alicloud_kms_key.default.id
  ]
}
