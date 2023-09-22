resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
  protection_level  = "REDUCED"
}

resource "alicloud_cen_transit_router" "default" {
  cen_id = alicloud_cen_instance.default.id
}

resource "alicloud_cen_transit_router_route_table" "default" {
  transit_router_id                      = alicloud_cen_transit_router.default.transit_router_id
  transit_router_route_table_description = var.transit_router_route_table_description_var
  transit_router_route_table_name        = var.transit_router_route_table_name_var
  dry_run                                = var.dry_run_var
  tags = {
    Created = "TF_Update"
    For     = "TransitRouterRouteTable_Update"
  }
}
