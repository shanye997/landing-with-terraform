resource "alicloud_kms_key" "key" {
  description = "example key"
  is_enabled  = true
}

resource "alicloud_kms_ciphertext" "encrypted" {
  key_id    = alicloud_kms_key.key.id
  plaintext = "example"
}