data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_drds_instance" "default" {
  instance_charge_type = "PostPaid"
  instance_series      = var.instance_series
  mysql_version        = "5"
  vpc_id               = data.alicloud_vpcs.default.ids.0
  specification        = "drds.sn1.4c8g.8C16G"
  vswitch_id           = data.alicloud_vswitches.default.vswitches.0.id
  zone_id              = data.alicloud_vswitches.default.vswitches.0.zone_id
  description          = var.name
}
