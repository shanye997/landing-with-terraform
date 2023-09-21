data "alicloud_account" "default" {
}

resource "alicloud_vpc_prefix_list" "default" {
  entrys {
    cidr = "192.168.0.0/16"
  }
}

resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
}

resource "alicloud_cen_transit_router" "default" {
  cen_id = alicloud_cen_instance.default.id
}

resource "alicloud_cen_transit_router_route_table" "default" {
  transit_router_id = alicloud_cen_transit_router.default.transit_router_id
}

resource "alicloud_cen_transit_router_prefix_list_association" "default" {
  next_hop_type           = "BlackHole"
  owner_uid               = data.alicloud_account.default.id
  prefix_list_id          = alicloud_vpc_prefix_list.default.id
  transit_router_id       = alicloud_cen_transit_router.default.transit_router_id
  transit_router_table_id = alicloud_cen_transit_router_route_table.default.transit_router_route_table_id
  next_hop                = "BlackHole"
}
