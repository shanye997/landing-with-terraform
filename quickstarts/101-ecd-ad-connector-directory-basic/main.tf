data "alicloud_ecd_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_ecd_zones.default.ids.0
}

resource "alicloud_ecd_ad_connector_directory" "default" {
  directory_name = var.name
  vswitch_ids = [
    data.alicloud_vswitches.default.ids.0
  ]
  dns_address = [
    "127.0.0.2"
  ]
  domain_name      = "corp.example.com"
  domain_user_name = "sAMAccountName"
  domain_password  = var.domain_password_var
}
