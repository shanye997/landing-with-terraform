data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = "${alicloud_vpc.default.id}"
  cidr_block   = "172.16.0.0/21"
  zone_id      = "${data.alicloud_zones.default.zones.0.id}"
  vswitch_name = "${var.name}"
}

resource "alicloud_nat_gateway" "default" {
  vpc_id           = "${alicloud_vswitch.default.vpc_id}"
  nat_gateway_name = "${var.name}"
  nat_type         = "Enhanced"
  vswitch_id       = alicloud_vswitch.default.id
}

resource "alicloud_eip_address" "default" {
  count        = "${var.number}"
  address_name = "${var.name}"
}

resource "alicloud_forward_entry" "default" {
  ip_protocol      = var.ip_protocol_var
  external_port    = var.external_port_var
  internal_port    = var.internal_port_var
  external_ip      = alicloud_eip_address.default.0.ip_address
  forward_table_id = alicloud_nat_gateway.default.forward_table_ids
  internal_ip      = var.internal_ip_var
}
