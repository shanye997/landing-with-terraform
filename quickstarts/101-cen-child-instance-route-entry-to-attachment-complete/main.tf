data "alicloud_cen_transit_router_available_resources" "default" {
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "192.168.0.0/16"
}

resource "alicloud_vswitch" "default_master" {
  vswitch_name = var.name
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "192.168.1.0/24"
  zone_id      = data.alicloud_cen_transit_router_available_resources.default.resources[0].master_zones[1]
}

resource "alicloud_vswitch" "default_slave" {
  vswitch_name = var.name
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "192.168.2.0/24"
  zone_id      = data.alicloud_cen_transit_router_available_resources.default.resources[0].slave_zones[2]
}

resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
  protection_level  = "REDUCED"
}

resource "alicloud_cen_transit_router" "default" {
  cen_id            = alicloud_cen_instance.default.id
  support_multicast = true
}

resource "alicloud_cen_transit_router_vpc_attachment" "default" {
  cen_id            = alicloud_cen_instance.default.id
  transit_router_id = alicloud_cen_transit_router.default.transit_router_id
  vpc_id            = alicloud_vpc.default.id
  zone_mappings {
    zone_id    = alicloud_vswitch.default_master.zone_id
    vswitch_id = alicloud_vswitch.default_master.id
  }
  zone_mappings {
    zone_id    = alicloud_vswitch.default_slave.zone_id
    vswitch_id = alicloud_vswitch.default_slave.id
  }
  transit_router_attachment_name        = var.name
  transit_router_attachment_description = var.name
  depends_on                            = ["alicloud_route_table.foo"]
}

resource "alicloud_route_table" "foo" {
  vpc_id           = alicloud_vpc.default.id
  route_table_name = var.name
  description      = var.name
}

resource "alicloud_cen_child_instance_route_entry_to_attachment" "default" {
  cen_id                        = alicloud_cen_instance.default.id
  child_instance_route_table_id = alicloud_route_table.foo.id
  destination_cidr_block        = "10.0.0.0/24"
  transit_router_attachment_id  = alicloud_cen_transit_router_vpc_attachment.default.transit_router_attachment_id
}
