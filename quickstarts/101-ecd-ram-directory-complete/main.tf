data "alicloud_ecd_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_ecd_zones.default.ids.0
}

resource "alicloud_ecd_ram_directory" "default" {
  ram_directory_name = var.name
  vswitch_ids = [
    data.alicloud_vswitches.default.ids.0
  ]
  desktop_access_type    = "INTERNET"
  enable_admin_access    = "true"
  enable_internet_access = "true"
}
