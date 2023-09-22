data "alicloud_express_connect_physical_connections" "default" {
  name_regex = "^preserved-NODELETING"
}

resource "alicloud_express_connect_virtual_border_router" "default" {
  vlan_id                    = var.vlan_id_var
  circuit_code               = var.circuit_code_var
  enable_ipv6                = var.enable_ipv6_var
  virtual_border_router_name = var.virtual_border_router_name_var
  detect_multiplier          = var.detect_multiplier_var
  include_cross_account_vbr  = false
  min_tx_interval            = var.min_tx_interval_var
  bandwidth                  = var.bandwidth_var
  local_gateway_ip           = var.local_gateway_ip_var
  peering_subnet_mask        = var.peering_subnet_mask_var
  peer_gateway_ip            = var.peer_gateway_ip_var
  min_rx_interval            = var.min_rx_interval_var
  physical_connection_id     = data.alicloud_express_connect_physical_connections.default.ids.0
  status                     = var.status_var
  description                = var.description_var
}
