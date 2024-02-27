variable "name" {
  default = "terraform-example"
}

provider "alicloud" {
  region = "me-east-1"
}

variable "spec" {
  default = "20"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = "me-east-1a"
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = "me-east-1a"
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_vpn_gateway" "default" {
  vpn_type         = "Normal"
  vpn_gateway_name = var.name

  vswitch_id   = local.vswitch_id
  auto_pay     = true
  vpc_id       = data.alicloud_vpcs.default.ids.0
  network_type = "public"
  payment_type = "Subscription"
  enable_ipsec = true
  bandwidth    = var.spec
}

resource "alicloud_vpn_customer_gateway" "default" {
  description           = var.name
  ip_address            = "4.3.2.10"
  asn                   = "1219002"
  customer_gateway_name = var.name
}

resource "alicloud_vpn_connection" "default" {
  local_subnet = [
    "3.0.0.0/24"
  ]
  enable_nat_traversal = "true"
  bgp_config {
    local_bgp_ip = "169.254.10.1"
    tunnel_cidr  = "169.254.10.0/30"
    enable       = "true"
    local_asn    = "1219002"
  }

  customer_gateway_id = alicloud_vpn_customer_gateway.default.id
  vpn_gateway_id      = alicloud_vpn_gateway.default.id
  vpn_connection_name = var.name
  effect_immediately  = "true"
  health_check_config {
    enable   = "true"
    dip      = "1.1.1.1"
    retry    = "3"
    sip      = "3.3.3.3"
    interval = "3"
  }

  remote_subnet = [
    "10.0.0.0/24",
    "10.0.1.0/24"
  ]
  ipsec_config {
    ipsec_enc_alg  = "aes"
    ipsec_auth_alg = "sha1"
    ipsec_lifetime = "86400"
    ipsec_pfs      = "group2"
  }

  auto_config_route = "true"
  enable_dpd        = "true"
  ike_config {
    ike_lifetime  = "86400"
    ike_local_id  = "localid1"
    ike_version   = "ikev2"
    ike_mode      = "main"
    psk           = "12345678"
    ike_remote_id = "remoteId2"
    ike_pfs       = "group2"
    ike_auth_alg  = "sha1"
    ike_enc_alg   = "aes"
  }
}