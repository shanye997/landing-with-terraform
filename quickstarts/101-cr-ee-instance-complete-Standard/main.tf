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
  instance_name          = "tf-example-standard-6725486"
  kms_encrypted_password = alicloud_kms_ciphertext.default.ciphertext_blob
  payment_type           = "Subscription"
  period                 = var.period_var
  instance_type          = "Standard"
  renew_period           = "0"
  renewal_status         = "ManualRenewal"
  password               = var.password_var
  kms_encryption_context = {

  }
}
