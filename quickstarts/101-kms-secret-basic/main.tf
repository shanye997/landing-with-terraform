resource "alicloud_kms_secret" "default" {
  secret_name = "tf_exampleKmsSecret_5076908"
  secret_data = var.secret_data_var
  version_id  = var.version_id_var
}
