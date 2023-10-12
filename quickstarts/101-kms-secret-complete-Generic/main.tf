resource "alicloud_kms_key" "default" {
  description            = var.name
  pending_window_in_days = 7
}

resource "alicloud_kms_secret" "default" {
  version_stages = [
    "ACSCurrent",
    "UStage1"
  ]
  description                   = var.description_var
  encryption_key_id             = alicloud_kms_key.default.id
  force_delete_without_recovery = var.force_delete_without_recovery_var
  secret_name                   = "tf_exampleKmsSecretWithKey_5220747"
  secret_type                   = "Generic"
  secret_data                   = var.secret_data_var
  version_id                    = var.version_id_var
  secret_data_type              = var.secret_data_type_var
  tags = {
    Description = "tf_exampleKmsSecret_3723810"
    usage       = "acceptanceTest"
  }
}
