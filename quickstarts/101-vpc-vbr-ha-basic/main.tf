data "alicloud_express_connect_physical_connections" "default" {
  name_regex = "^preserved-NODELETING"
}

resource "alicloud_express_connect_virtual_border_router" "default" {
  count                      = 2
  local_gateway_ip           = "10.0.0.1"
  peer_gateway_ip            = "10.0.0.2"
  peering_subnet_mask        = "255.255.255.252"
  physical_connection_id     = data.alicloud_express_connect_physical_connections.default.connections[count.index].id
  virtual_border_router_name = var.name
  vlan_id                    = 2856
  min_rx_interval            = 1000
  min_tx_interval            = 1000
  detect_multiplier          = 10
}

resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
  description       = var.name
}

resource "alicloud_cen_instance_attachment" "default" {
  count                    = 2
  instance_id              = alicloud_cen_instance.default.id
  child_instance_id        = alicloud_express_connect_virtual_border_router.default[count.index].id
  child_instance_type      = "VBR"
  child_instance_region_id = "cn-hangzhou"
}

resource "alicloud_vpc_vbr_ha" "default" {
  vbr_id      = alicloud_express_connect_virtual_border_router.default[0].id
  peer_vbr_id = alicloud_express_connect_virtual_border_router.default[1].id
  depends_on = [
    alicloud_cen_instance_attachment.default
  ]
}
