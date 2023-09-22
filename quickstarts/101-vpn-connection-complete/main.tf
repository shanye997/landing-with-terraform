resource "alicloud_vpc" "default" {
  cidr_block = "172.16.0.0/12"
  name       = "${var.name}"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vswitch" "default" {
  vpc_id            = "${alicloud_vpc.default.id}"
  cidr_block        = "172.16.0.0/21"
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  name              = "${var.name}"
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
  ip_address  = "42.104.22.210"
  description = "exampleVpnConnectionDesc"
}

resource "alicloud_vpn_connection" "default" {
  name                 = "${var.name}_change"
  effect_immediately   = var.effect_immediately_var
  enable_nat_traversal = var.enable_nat_traversal_var
  health_check_config {
    dip      = "10.0.0.1"
    enable   = "true"
    interval = "10"
    retry    = "10"
    sip      = "192.168.1.1"
  }

  local_subnet = [
    "172.16.1.0/24",
    "172.16.2.0/24"
  ]
  remote_subnet = [
    "10.4.0.0/24",
    "10.0.3.0/24"
  ]
  vpn_gateway_id      = alicloud_vpn_gateway.default.id
  customer_gateway_id = alicloud_vpn_customer_gateway.default.id
  ike_config {
    ike_mode      = "main"
    ike_remote_id = "testbob2"
    ike_enc_alg   = "des"
    ike_lifetime  = "86400"
    ike_pfs       = "group1"
    ike_version   = "ikev2"
    psk           = "tf-testvpn2"
    ike_auth_alg  = "md5"
    ike_local_id  = "testalice2"
  }

  ipsec_config {
    ipsec_enc_alg  = "des"
    ipsec_lifetime = "8640"
    ipsec_pfs      = "group5"
    ipsec_auth_alg = "md5"
  }

  bgp_config {
    enable       = "true"
    local_asn    = "45014"
    local_bgp_ip = "169.254.11.1"
    tunnel_cidr  = "169.254.11.0/30"
  }

  enable_dpd = var.enable_dpd_var
}
