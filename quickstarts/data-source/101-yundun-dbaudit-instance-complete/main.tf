data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_yundun_dbaudit_instance" "default" {
  description = "${var.name}"
  plan_code   = "alpha.professional"
  period      = "1"
  vswitch_id  = data.alicloud_vswitches.default.ids.0
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

data "alicloud_yundun_dbaudit_instance" "default" {
  ids = [
    "${alicloud_yundun_dbaudit_instance.default.id}-fake"
  ]
  tags = {
    For = "acceptance test-fake"
  }
  description_regex = "${alicloud_yundun_dbaudit_instance.default.description}-fake"
}
