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

data "alicloud_express_connect_physical_connections" "nameRegex" {
  name_regex = "^preserved-NODELETING"
}

resource "alicloud_express_connect_virtual_border_router" "default" {
  local_gateway_ip           = "10.0.0.1"
  peer_gateway_ip            = "10.0.0.2"
  peering_subnet_mask        = "255.255.255.252"
  physical_connection_id     = data.alicloud_express_connect_physical_connections.nameRegex.connections.0.id
  virtual_border_router_name = var.name
  vlan_id                    = 545
  min_rx_interval            = 1000
  min_tx_interval            = 1000
  detect_multiplier          = 10
}

resource "alicloud_cen_transit_router_vbr_attachment" "default" {
  cen_id                                = alicloud_cen_instance.default.id
  transit_router_id                     = alicloud_cen_transit_router.default.transit_router_id
  vbr_id                                = alicloud_express_connect_virtual_border_router.default.id
  auto_publish_route_enabled            = true
  transit_router_attachment_name        = var.name
  transit_router_attachment_description = var.name
}

resource "alicloud_cen_transit_router_route_entry" "default" {
  transit_router_route_entry_next_hop_type          = "Attachment"
  dry_run                                           = var.dry_run_var
  transit_router_route_table_id                     = alicloud_cen_transit_router_route_table.default.transit_router_route_table_id
  transit_router_route_entry_description            = var.transit_router_route_entry_description_var
  transit_router_route_entry_destination_cidr_block = "192.168.1.0/24"
  transit_router_route_entry_name                   = var.transit_router_route_entry_name_var
  transit_router_route_entry_next_hop_id            = alicloud_cen_transit_router_vbr_attachment.default.transit_router_attachment_id
}
