data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "defaultVpc" {
  description = "tf-example-vpc"
  vpc_name    = var.name
  cidr_block  = "192.168.0.0/16"
}

resource "alicloud_vswitch" "defaultVswitch" {
  vpc_id       = alicloud_vpc.defaultVpc.id
  cidr_block   = "192.168.0.0/21"
  vswitch_name = "${var.name}1"
  zone_id      = data.alicloud_zones.default.zones.0.id
  description  = "tf-example-vswitch"
}

resource "alicloud_vpc_ha_vip" "default" {
  vswitch_id = alicloud_vswitch.defaultVswitch.id
}
