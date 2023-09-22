data "alicloud_eci_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_eci_zones.default.zones.0.zone_ids.0
}

resource "alicloud_security_group" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
  name   = var.name
}

resource "alicloud_eci_virtual_node" "default" {
  kube_config       = var.kube_config
  vswitch_id        = data.alicloud_vswitches.default.ids.1
  security_group_id = alicloud_security_group.default.id
}
