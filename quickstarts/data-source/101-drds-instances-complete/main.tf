data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = "${data.alicloud_vpcs.default.ids.0}"
  zone_id = data.alicloud_zones.default.ids.0
}

resource "alicloud_drds_instance" "default" {
  description          = "${var.name}"
  zone_id              = "${data.alicloud_vswitches.default.vswitches.0.zone_id}"
  instance_series      = "drds.sn1.4c8g"
  instance_charge_type = "PostPaid"
  vswitch_id           = "${data.alicloud_vswitches.default.vswitches.0.id}"
  specification        = "drds.sn1.4c8g.8C16G"
}

data "alicloud_drds_instances" "default" {
  description_regex = "${alicloud_drds_instance.default.description}-fake"
  ids = [
    "${alicloud_drds_instance.default.id}-fake"
  ]
}
