data "alicloud_express_connect_physical_connections" "default" {
  name_regex = "^preserved-NODELETING"
}

resource "alicloud_express_connect_virtual_border_router" "default" {
  vlan_id                = var.vlan_id_var
  physical_connection_id = data.alicloud_express_connect_physical_connections.default.ids.0
  peer_gateway_ip        = var.peer_gateway_ip_var
  local_gateway_ip       = var.local_gateway_ip_var
  peering_subnet_mask    = var.peering_subnet_mask_var
}
