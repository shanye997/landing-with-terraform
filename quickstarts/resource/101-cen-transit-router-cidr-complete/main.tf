resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
}

resource "alicloud_cen_transit_router" "default" {
  cen_id = alicloud_cen_instance.default.id
}

resource "alicloud_cen_transit_router_cidr" "default" {
  publish_cidr_route       = var.publish_cidr_route_var
  transit_router_cidr_name = var.transit_router_cidr_name_var
  transit_router_id        = alicloud_cen_transit_router.default.transit_router_id
  cidr                     = var.cidr_var
  description              = var.description_var
}
