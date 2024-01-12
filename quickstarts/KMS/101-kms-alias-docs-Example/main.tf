resource "alicloud_kms_key" "this" {}

resource "alicloud_kms_alias" "this" {
  alias_name = "alias/test_kms_alias"
  key_id     = alicloud_kms_key.this.id
}