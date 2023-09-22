resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
}

resource "alicloud_cen_transit_router" "default" {
  cen_id              = alicloud_cen_instance.default.id
  transit_router_name = var.name
}

resource "alicloud_cen_traffic_marking_policy" "default" {
  priority          = "5"
  transit_router_id = alicloud_cen_transit_router.default.transit_router_id
  marking_dscp      = "5"
}
