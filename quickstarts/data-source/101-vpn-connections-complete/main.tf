resource "alicloud_vpc" "default" {
  cidr_block = "172.16.0.0/12"
  vpc_name   = "${var.name}"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = "${alicloud_vpc.default.id}"
  cidr_block   = "172.16.0.0/21"
  zone_id      = "${data.alicloud_zones.default.zones.0.id}"
  vswitch_name = "${var.name}"
}

resource "alicloud_vpn_gateway" "default" {
  name                 = "${var.name}"
  vpc_id               = "${alicloud_vswitch.default.vpc_id}"
  bandwidth            = "10"
  enable_ssl           = true
  instance_charge_type = "PostPaid"
  description          = "test_create_description"
}

resource "alicloud_vpn_customer_gateway" "default" {
  name        = "${var.name}"
  ip_address  = "41.104.22.229"
  description = "${var.name}"
}

resource "alicloud_vpn_connection" "default" {
  name                = "${var.name}"
  vpn_gateway_id      = "${alicloud_vpn_gateway.default.id}"
  customer_gateway_id = "${alicloud_vpn_customer_gateway.default.id}"
  local_subnet        = ["172.16.1.0/24"]
  remote_subnet       = ["10.4.0.0/24"]
  effect_immediately  = true
  ike_config {
    ike_auth_alg  = "sha1"
    ike_enc_alg   = "3des"
    ike_version   = "ikev2"
    ike_mode      = "aggressive"
    ike_lifetime  = 8640
    psk           = "tf-testvpn1"
    ike_pfs       = "group2"
    ike_remote_id = "testbob1"
    ike_local_id  = "testalice1"
  }

  ipsec_config {
    ipsec_pfs      = "group2"
    ipsec_enc_alg  = "aes"
    ipsec_auth_alg = "sha1"
    ipsec_lifetime = 86400
  }

  health_check_config {
    enable   = "true"
    dip      = "192.168.10.1"
    sip      = "10.10.1.1"
    interval = 3
    retry    = 3
  }

  bgp_config {
    enable       = "true"
    local_asn    = "45104"
    tunnel_cidr  = "169.254.11.0/30"
    local_bgp_ip = "169.254.11.1"

  }

}

data "alicloud_vpn_connections" "default" {
  customer_gateway_id = alicloud_vpn_connection.default.customer_gateway_id
  ids = [
    alicloud_vpn_connection.default.id
  ]
  name_regex     = "tf-exampleVpnConnDataResource2834_fake"
  vpn_gateway_id = alicloud_vpn_connection.default.vpn_gateway_id
}
