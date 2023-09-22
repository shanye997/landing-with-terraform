resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
}

resource "alicloud_cen_transit_router" "default" {
  cen_id = alicloud_cen_instance.default.id
}

resource "alicloud_cen_transit_router_cidr" "default" {
  transit_router_id = alicloud_cen_transit_router.default.transit_router_id
  cidr              = var.cidr_var
}
