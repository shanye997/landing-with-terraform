resource "alicloud_kms_key" "default" {
  pending_window_in_days = "7"
  status                 = "Enabled"
}

resource "alicloud_hbr_vault" "default" {
  vault_name   = var.vault_name_var
  encrypt_type = "KMS"
  kms_key_id   = alicloud_kms_key.default.id
}
