data "alicloud_instances" "default" {
  name_regex = "no-deleteing-ipv6-address"
  status     = "Running"
}

data "alicloud_vpc_ipv6_addresses" "default" {
  associated_instance_id = data.alicloud_instances.default.instances.0.id
  status                 = "Available"
}

resource "alicloud_vpc_ipv6_egress_rule" "default" {
  description           = var.name
  instance_id           = data.alicloud_vpc_ipv6_addresses.default.ids.0
  instance_type         = "Ipv6Address"
  ipv6_egress_rule_name = var.name
  ipv6_gateway_id       = data.alicloud_vpc_ipv6_addresses.default.addresses.0.ipv6_gateway_id
}
