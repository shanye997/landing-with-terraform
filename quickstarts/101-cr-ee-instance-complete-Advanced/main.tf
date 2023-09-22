data "alicloud_kms_keys" "default" {
  status = "Enabled"
}

resource "alicloud_kms_key" "default" {
  count                  = length(data.alicloud_kms_keys.default.ids) > 0 ? 0 : 1
  description            = var.name
  status                 = "Enabled"
  pending_window_in_days = 7
}

resource "alicloud_kms_ciphertext" "default" {
  key_id    = length(data.alicloud_kms_keys.default.ids) > 0 ? data.alicloud_kms_keys.default.ids.0 : concat(alicloud_kms_key.default.*.id, [""])[0]
  plaintext = "YourPassword1234"
  encryption_context = {
    "name" = var.name
  }
}

resource "alicloud_cr_ee_instance" "default" {
  period                 = var.period_var
  password               = var.password_var
  renew_period           = "0"
  kms_encrypted_password = alicloud_kms_ciphertext.default.ciphertext_blob
  instance_type          = "Advanced"
  kms_encryption_context = {

  }
  payment_type   = "Subscription"
  instance_name  = "tf-example-advanced-759994"
  renewal_status = "ManualRenewal"
}
