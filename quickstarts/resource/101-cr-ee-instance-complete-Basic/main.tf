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
  kms_encrypted_password = alicloud_kms_ciphertext.default.ciphertext_blob
  password               = var.password_var
  payment_type           = "Subscription"
  instance_name          = "tf-example-basic-6845845"
  instance_type          = "Basic"
  renewal_status         = "ManualRenewal"
  renew_period           = "0"
  kms_encryption_context = {

  }
}
