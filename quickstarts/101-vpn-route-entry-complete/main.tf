data "alicloud_zones" "default" {
}

resource "alicloud_vpc" "default" {
  name       = "tf-examplecn-hangzhouvpnRouteEntrybasic1129027020808325986"
  cidr_block = "10.1.0.0/21"
}

resource "alicloud_vswitch" "default" {
  name              = "${alicloud_vpc.default.name}"
  vpc_id            = "${alicloud_vpc.default.id}"
  cidr_block        = "10.1.1.0/24"
  availability_zone = "${data.alicloud_zones.default.ids.0}"
}

resource "alicloud_vpn_gateway" "default" {
  name                 = "${alicloud_vpc.default.name}"
  vpc_id               = "${alicloud_vpc.default.id}"
  bandwidth            = 10
  instance_charge_type = "PostPaid"
  enable_ssl           = false
  vswitch_id           = "${alicloud_vswitch.default.id}"
}

resource "alicloud_vpn_connection" "default" {
  name                = "${alicloud_vpc.default.name}"
  customer_gateway_id = "${alicloud_vpn_customer_gateway.default.id}"
  vpn_gateway_id      = "${alicloud_vpn_gateway.default.id}"
  local_subnet        = ["192.168.2.0/24"]
  remote_subnet       = ["192.168.3.0/24"]
}

resource "alicloud_vpn_customer_gateway" "default" {
  name       = "${alicloud_vpc.default.name}"
  ip_address = "192.168.1.1"
}

resource "alicloud_vpn_route_entry" "default" {
  weight         = var.weight_var
  next_hop       = alicloud_vpn_connection.default.id
  publish_vpc    = var.publish_vpc_var
  route_dest     = "10.0.0.0/24"
  vpn_gateway_id = alicloud_vpn_gateway.default.id
}
