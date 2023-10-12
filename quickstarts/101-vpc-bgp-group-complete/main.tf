data "alicloud_express_connect_physical_connections" "default" {
  name_regex = "^preserved-NODELETING"
}

resource "alicloud_express_connect_virtual_border_router" "default" {
  local_gateway_ip           = "10.0.0.1"
  peer_gateway_ip            = "10.0.0.2"
  peering_subnet_mask        = "255.255.255.252"
  physical_connection_id     = data.alicloud_express_connect_physical_connections.default.connections.0.id
  virtual_border_router_name = var.name
  vlan_id                    = 2645
  min_rx_interval            = 1000
  min_tx_interval            = 1000
  detect_multiplier          = 10
}

resource "alicloud_vpc_bgp_group" "default" {
  router_id      = alicloud_express_connect_virtual_border_router.default.id
  auth_key       = var.auth_key_var
  bgp_group_name = var.name
  is_fake_asn    = var.is_fake_asn_var
  description    = var.name
  local_asn      = var.local_asn_var
  peer_asn       = var.peer_asn_var
}
