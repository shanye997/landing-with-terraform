resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
  protection_level  = "REDUCED"
}

resource "alicloud_cen_transit_router" "default" {
  cen_id = alicloud_cen_instance.default.id
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
  vlan_id                    = 2609
  min_rx_interval            = 1000
  min_tx_interval            = 1000
  detect_multiplier          = 10
}

data "alicloud_account" "default" {}

resource "alicloud_cen_transit_router_vbr_attachment" "default" {
  route_table_propagation_enabled = "false"
  route_table_association_enabled = "false"
  tags = {
    Created = "TF_Update"
    For     = "TransitRouterVbrAttachment_Update"
  }
  transit_router_id                     = alicloud_cen_transit_router.default.transit_router_id
  vbr_id                                = alicloud_express_connect_virtual_border_router.default.id
  cen_id                                = alicloud_cen_instance.default.id
  vbr_owner_id                          = data.alicloud_account.default.id
  dry_run                               = var.dry_run_var
  auto_publish_route_enabled            = var.auto_publish_route_enabled_var
  resource_type                         = var.resource_type_var
  transit_router_attachment_description = var.transit_router_attachment_description_var
  transit_router_attachment_name        = var.transit_router_attachment_name_var
}
