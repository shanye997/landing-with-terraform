data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_lindorm_instance" "default_2" {
  disk_category = "cloud_efficiency"
  payment_type  = "PayAsYouGo"
  vswitch_id    = data.alicloud_vswitches.default.ids[0]
}
