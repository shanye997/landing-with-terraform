data "alicloud_ecd_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_ecd_zones.default.ids.0
}

resource "alicloud_ecd_ram_directory" "default" {
  vswitch_ids = [
    data.alicloud_vswitches.default.ids.0
  ]
  ram_directory_name = var.name
}
