data "alicloud_express_connect_physical_connections" "default" {
  name_regex = "^preserved-NODELETING"
}

resource "alicloud_express_connect_virtual_border_router" "default" {
  local_gateway_ip           = "10.0.0.1"
  peer_gateway_ip            = "10.0.0.2"
  peering_subnet_mask        = "255.255.255.252"
  physical_connection_id     = data.alicloud_express_connect_physical_connections.default.connections.0.id
  virtual_border_router_name = var.name
  vlan_id                    = 152
  min_rx_interval            = 1000
  min_tx_interval            = 1000
  detect_multiplier          = 10
}

resource "alicloud_vpc_bgp_group" "default" {
  auth_key       = "YourPassword+12345678"
  bgp_group_name = var.name
  description    = var.name
  local_asn      = 64512
  peer_asn       = 1111
  router_id      = alicloud_express_connect_virtual_border_router.default.id
}

resource "alicloud_vpc_bgp_peer" "default" {
  bfd_multi_hop   = var.bfd_multi_hop_var
  bgp_group_id    = alicloud_vpc_bgp_group.default.id
  enable_bfd      = var.enable_bfd_var
  ip_version      = "IPV4"
  peer_ip_address = var.peer_ip_address_var
}
