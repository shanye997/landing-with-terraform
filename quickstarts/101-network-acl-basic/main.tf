data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  cidr_block = "192.168.0.0/16"
  vpc_name   = var.name
}

resource "alicloud_vswitch" "default0" {
  vpc_id       = alicloud_vpc.default.id
  vswitch_name = var.name
  cidr_block   = cidrsubnets(alicloud_vpc.default.cidr_block, 4, 4)[0]
  zone_id      = data.alicloud_zones.default.ids.0
}

resource "alicloud_network_acl" "default" {
  resources {
    resource_id   = alicloud_vswitch.default0.id
    resource_type = "VSwitch"
  }

  vpc_id = alicloud_vpc.default.id
}
