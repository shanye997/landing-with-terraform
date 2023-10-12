data "alicloud_pvtz_resolver_zones" "default" {
  status = "NORMAL"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_security_group" "default" {
  vpc_id = alicloud_vpc.default.id
  name   = var.name
}

resource "alicloud_vswitch" "default" {
  count      = 4
  vpc_id     = alicloud_vpc.default.id
  cidr_block = cidrsubnet(alicloud_vpc.default.cidr_block, 8, count.index)
  zone_id    = data.alicloud_pvtz_resolver_zones.default.zones[count.index].zone_id
}

resource "alicloud_pvtz_endpoint" "default" {
  vpc_id        = alicloud_vpc.default.id
  vpc_region_id = "cn-hangzhou"
  endpoint_name = var.endpoint_name_var
  ip_configs {
    cidr_block = alicloud_vswitch.default[2].cidr_block
    vswitch_id = alicloud_vswitch.default[2].id
    zone_id    = alicloud_vswitch.default[2].zone_id
  }
  ip_configs {
    cidr_block = alicloud_vswitch.default[3].cidr_block
    vswitch_id = alicloud_vswitch.default[3].id
    zone_id    = alicloud_vswitch.default[3].zone_id
  }

  security_group_id = alicloud_security_group.default.id
}
