data "alicloud_ecd_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_ecd_zones.default.ids.0
}

resource "alicloud_ecd_ad_connector_directory" "default" {
  desktop_access_type = "INTERNET"
  dns_address = [
    "127.0.0.2"
  ]
  sub_domain_name  = "child.example.com"
  domain_password  = var.domain_password_var
  domain_user_name = "sAMAccountName"
  mfa_enabled      = "false"
  sub_domain_dns_address = [
    "127.0.0.3"
  ]
  vswitch_ids = [
    data.alicloud_vswitches.default.ids.0
  ]
  domain_name         = "corp.example.com"
  specification       = var.specification_var
  enable_admin_access = "true"
  directory_name      = var.name
}
