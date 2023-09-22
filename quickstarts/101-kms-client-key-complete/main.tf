resource "alicloud_kms_application_access_point" "AAP0" {
  application_access_point_name = var.name
  description                   = var.name
  policies                      = ["aaa"]
}

resource "alicloud_kms_client_key" "default" {
  not_after             = "2028-09-01T14:11:22Z"
  not_before            = "2023-09-01T14:11:22Z"
  password              = "YouPassword123!"
  private_key_data_file = "./hello.txt"
  aap_name              = alicloud_kms_application_access_point.AAP0.application_access_point_name
}
