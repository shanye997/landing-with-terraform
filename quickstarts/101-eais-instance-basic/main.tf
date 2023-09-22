data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.ids.0
}

resource "alicloud_security_group" "default" {
  name        = var.name
  description = "tf test"
  vpc_id      = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_eais_instance" "default" {
  instance_type     = "eais.ei-a6.medium"
  vswitch_id        = data.alicloud_vswitches.default.ids.0
  security_group_id = alicloud_security_group.default.id
}
