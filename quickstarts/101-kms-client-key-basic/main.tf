resource "alicloud_kms_application_access_point" "AAP0" {
  application_access_point_name = var.name
  description                   = var.name
  policies                      = ["aaa"]
}

resource "alicloud_kms_client_key" "default" {
  password = "YouPassword123!"
  aap_name = alicloud_kms_application_access_point.AAP0.application_access_point_name
}
