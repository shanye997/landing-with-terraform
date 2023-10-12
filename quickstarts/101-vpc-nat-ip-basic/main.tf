data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "172.16.0.0/21"
  zone_id      = data.alicloud_zones.default.zones.0.id
  vswitch_name = var.name
}

resource "alicloud_nat_gateway" "default" {
  vpc_id           = alicloud_vpc.default.id
  nat_gateway_name = var.name
  description      = "${var.name}_description"
  nat_type         = "Enhanced"
  vswitch_id       = alicloud_vswitch.default.id
  network_type     = "intranet"
}

resource "alicloud_vpc_nat_ip" "default" {
  nat_gateway_id = alicloud_nat_gateway.default.id
}
