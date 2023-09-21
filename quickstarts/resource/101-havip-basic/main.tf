data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  cidr_block = "192.168.0.0/16"
  vpc_name   = var.name
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  zone_id      = data.alicloud_zones.default.zones.0.id
  cidr_block   = "192.168.0.0/21"
  vpc_id       = alicloud_vpc.default.id
}

resource "alicloud_havip" "default" {
  vswitch_id = alicloud_vswitch.default.id
}
