resource "alicloud_vpn_ipsec_server" "default" {
  local_subnet   = var.local_subnet_var
  client_ip_pool = var.client_ip_pool_var
  vpn_gateway_id = local.vpn_gateway_id
}
