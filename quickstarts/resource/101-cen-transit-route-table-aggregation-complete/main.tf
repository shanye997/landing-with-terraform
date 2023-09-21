resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
}

resource "alicloud_cen_transit_router" "default" {
  cen_id = alicloud_cen_instance.default.id
}

resource "alicloud_cen_transit_router_route_table" "default" {
  transit_router_id = alicloud_cen_transit_router.default.transit_router_id
}

resource "alicloud_cen_transit_route_table_aggregation" "default" {
  transit_route_table_aggregation_cidr        = "10.0.0.0/8"
  transit_route_table_aggregation_description = "tf-exampleCenTransitRouteTableAggregation-name5691"
  transit_route_table_aggregation_name        = "tf-exampleCenTransitRouteTableAggregation-name5691"
  transit_route_table_aggregation_scope       = "VPC"
  transit_route_table_id                      = alicloud_cen_transit_router_route_table.default.transit_router_route_table_id
}
