data "alicloud_express_connect_physical_connections" "nameRegex" {
  name_regex = "^preserved-NODELETING"
}

resource "alicloud_express_connect_virtual_border_router" "default" {
  local_gateway_ip           = "10.0.0.1"
  peer_gateway_ip            = "10.0.0.2"
  peering_subnet_mask        = "255.255.255.252"
  physical_connection_id     = data.alicloud_express_connect_physical_connections.nameRegex.connections.0.id
  virtual_border_router_name = var.name
  vlan_id                    = 2139
  min_rx_interval            = 1000
  min_tx_interval            = 1000
  detect_multiplier          = 10
}

data "alicloud_express_connect_virtual_border_routers" "default" {
  name_regex = "tf-exampleExpressConnectVirtualBorderRoutersTest2722"
  status     = "active"
  filter {
    key = "PhysicalConnectionId"
    values = [
      alicloud_express_connect_virtual_border_router.default.physical_connection_id
    ]
  }
  filter {
    key = "VbrId"
    values = [
      alicloud_express_connect_virtual_border_router.default.id
    ]
  }

  ids = [
    alicloud_express_connect_virtual_border_router.default.id
  ]
}
