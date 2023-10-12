provider "alicloud" {
  alias  = "bj"
  region = "cn-beijing"
}

resource "alicloud_cen_instance" "default" {
  provider         = alicloud.cn
  name             = var.name
  protection_level = "REDUCED"
}

resource "alicloud_cen_bandwidth_package" "default" {
  provider                   = alicloud.cn
  bandwidth                  = 5
  cen_bandwidth_package_name = var.name
  geographic_region_a_id     = "China"
  geographic_region_b_id     = "China"
}

resource "alicloud_cen_bandwidth_package_attachment" "default" {
  provider             = alicloud.cn
  instance_id          = alicloud_cen_instance.default.id
  bandwidth_package_id = alicloud_cen_bandwidth_package.default.id
}

resource "alicloud_cen_transit_router" "default_0" {
  provider            = alicloud.cn
  cen_id              = alicloud_cen_bandwidth_package_attachment.default.instance_id
  transit_router_name = "${var.name}-00"
}

resource "alicloud_cen_transit_router" "default_1" {
  provider            = alicloud.bj
  cen_id              = alicloud_cen_transit_router.default_0.cen_id
  transit_router_name = "${var.name}-01"
}

resource "alicloud_cen_transit_router_peer_attachment" "default" {
  peer_transit_router_id        = alicloud_cen_transit_router.default_1.transit_router_id
  provider                      = "alicloud.cn"
  cen_id                        = alicloud_cen_instance.default.id
  peer_transit_router_region_id = "cn-beijing"
}
