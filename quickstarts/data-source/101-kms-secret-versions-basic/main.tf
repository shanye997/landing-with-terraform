resource "alicloud_kms_secret" "default" {
  secret_name = "tf_exampleKmsSecretsVersionsDataSource_2963314"
  secret_data = "user:root:passwd:1234"
  version_id  = "v001"
}

data "alicloud_kms_secret_versions" "default" {
  secret_name = alicloud_kms_secret.default.secret_name
}
