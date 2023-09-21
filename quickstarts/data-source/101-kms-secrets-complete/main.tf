resource "alicloud_kms_secret" "default" {
  secret_name = "tf-exampleKmsSecret-2090341"
  secret_data = "user:root:passwd:1234"
  version_id  = "v001"
  tags = {
    Created = "TF"
    For     = "Secrettest"
  }
}

data "alicloud_kms_secrets" "default" {
  ids = [
    "${alicloud_kms_secret.default.secret_name}-fake"
  ]
  name_regex = "^${alicloud_kms_secret.default.secret_name}"
  tags = {
    For     = "Secrettest"
    Created = "TF_fake"
  }
  fetch_tags = "true"
}
