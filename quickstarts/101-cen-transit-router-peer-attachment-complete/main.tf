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
  peer_transit_router_region_id         = "cn-beijing"
  resource_type                         = "TR"
  provider                              = "alicloud.cn"
  route_table_association_enabled       = "false"
  auto_publish_route_enabled            = var.auto_publish_route_enabled_var
  cen_bandwidth_package_id              = alicloud_cen_bandwidth_package.default.id
  bandwidth_type                        = var.bandwidth_type_var
  transit_router_attachment_name        = var.transit_router_attachment_name_var
  cen_id                                = alicloud_cen_instance.default.id
  transit_router_id                     = alicloud_cen_transit_router.default_0.transit_router_id
  dry_run                               = var.dry_run_var
  peer_transit_router_id                = alicloud_cen_transit_router.default_1.transit_router_id
  transit_router_attachment_description = var.transit_router_attachment_description_var
  bandwidth                             = var.bandwidth_var
  route_table_propagation_enabled       = "false"
}
