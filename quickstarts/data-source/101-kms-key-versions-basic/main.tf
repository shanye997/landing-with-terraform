resource "alicloud_kms_key" "default" {
  description            = "tf_exampleKmsKeyVersionsDataSource_3223189"
  pending_window_in_days = 7
}

data "alicloud_kms_key_versions" "default" {
  key_id = alicloud_kms_key.default.id
}
