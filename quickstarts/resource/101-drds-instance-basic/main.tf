data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_drds_instance" "default" {
  specification   = "drds.sn1.4c8g.8C16G"
  instance_series = var.instance_series
  zone_id         = data.alicloud_vswitches.default.vswitches.0.zone_id
  description     = var.name
  vswitch_id      = data.alicloud_vswitches.default.vswitches.0.id
}
