data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  name_regex = "default-zone-i"
  vpc_id     = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
}

resource "alicloud_cen_transit_router" "default" {
  cen_id            = alicloud_cen_instance.default.id
  support_multicast = true
}

resource "alicloud_cen_transit_router_multicast_domain" "default" {
  transit_router_id = alicloud_cen_transit_router.default.transit_router_id
}

resource "alicloud_cen_transit_router_vpc_attachment" "default" {
  cen_id            = alicloud_cen_transit_router.default.cen_id
  transit_router_id = alicloud_cen_transit_router_multicast_domain.default.transit_router_id
  vpc_id            = data.alicloud_vpcs.default.ids.0
  zone_mappings {
    zone_id    = data.alicloud_vswitches.default.vswitches.0.zone_id
    vswitch_id = data.alicloud_vswitches.default.vswitches.0.id
  }
}

resource "alicloud_cen_transit_router_multicast_domain_association" "default" {
  transit_router_attachment_id       = alicloud_cen_transit_router_vpc_attachment.default.transit_router_attachment_id
  transit_router_multicast_domain_id = alicloud_cen_transit_router_multicast_domain.default.id
  vswitch_id                         = data.alicloud_vswitches.default.vswitches.0.id
}
