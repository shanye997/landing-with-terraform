resource "alicloud_kms_key" "this" {}

resource "alicloud_kms_key_version" "keyversion" {
  key_id = alicloud_kms_key.this.id
}