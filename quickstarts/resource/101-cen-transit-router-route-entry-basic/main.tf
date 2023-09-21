resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
  protection_level  = "REDUCED"
}

resource "alicloud_cen_transit_router" "default" {
  cen_id = alicloud_cen_instance.default.id
}

resource "alicloud_cen_transit_router_route_table" "default" {
  transit_router_id               = alicloud_cen_transit_router.default.transit_router_id
  transit_router_route_table_name = var.name
}

resource "alicloud_cen_transit_router_route_entry" "default" {
  transit_router_route_entry_destination_cidr_block = "192.168.1.0/24"
  transit_router_route_entry_next_hop_type          = "Attachment"
  transit_router_route_table_id                     = alicloud_cen_transit_router_route_table.default.transit_router_route_table_id
}
