resource "alicloud_vpn_ipsec_server" "default" {
  ike_config {
    local_id     = "127.0.0.2"
    remote_id    = "127.0.0.1"
    ike_auth_alg = "sha1"
    ike_enc_alg  = "aes"
    ike_lifetime = "86400"
    ike_mode     = "main"
    ike_pfs      = "group2"
    ike_version  = "ikev2"
  }

  psk_enabled        = var.psk_enabled_var
  ipsec_server_name  = var.name
  client_ip_pool     = var.client_ip_pool_var
  local_subnet       = var.local_subnet_var
  psk                = var.psk_var
  effect_immediately = var.effect_immediately_var
  vpn_gateway_id     = local.vpn_gateway_id
  ipsec_config {
    ipsec_auth_alg = "sha1"
    ipsec_enc_alg  = "aes"
    ipsec_lifetime = "66400"
    ipsec_pfs      = "group2"
  }

}
