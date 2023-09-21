resource "alicloud_kms_secret" "default" {
  secret_name = "tf_exampleKmsSecretsVersionsDataSource_2963314"
  secret_data = "user:root:passwd:1234"
  version_id  = "v001"
}

data "alicloud_kms_secret_versions" "default" {
  version_stage  = "ACSCurrent"
  enable_details = var.enable_details_var
  ids = [
    "${alicloud_kms_secret.default.version_id}-fake"
  ]
  secret_name = alicloud_kms_secret.default.secret_name
}
