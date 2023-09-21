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
  customer_gateway_id = alicloud_vpn_customer_gateway.default.id
  vpn_gateway_id      = alicloud_vpn_gateway.default.id
  local_subnet = [
    "172.16.1.0/24",
    "172.16.2.0/24"
  ]
  remote_subnet = [
    "10.4.0.0/24",
    "10.0.3.0/24"
  ]
}
