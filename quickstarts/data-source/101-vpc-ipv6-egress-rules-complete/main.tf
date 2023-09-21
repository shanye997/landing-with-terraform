data "alicloud_instances" "default" {
  name_regex = "no-deleteing-ipv6-address"
  status     = "Running"
}

data "alicloud_vpc_ipv6_addresses" "default" {
  associated_instance_id = data.alicloud_instances.default.instances.0.id
  status                 = "Available"
}

resource "alicloud_vpc_ipv6_egress_rule" "default" {
  ipv6_egress_rule_name = var.name
  ipv6_gateway_id       = data.alicloud_vpc_ipv6_addresses.default.addresses.0.ipv6_gateway_id
  instance_id           = data.alicloud_vpc_ipv6_addresses.default.ids.0
  instance_type         = "Ipv6Address"
  description           = var.name
}

data "alicloud_vpc_ipv6_egress_rules" "default" {
  name_regex  = "${alicloud_vpc_ipv6_egress_rule.default.ipv6_egress_rule_name}-fake"
  instance_id = alicloud_vpc_ipv6_egress_rule.default.instance_id
  status      = "Available"
  ids = [
    alicloud_vpc_ipv6_egress_rule.default.id
  ]
  ipv6_gateway_id       = alicloud_vpc_ipv6_egress_rule.default.ipv6_gateway_id
  ipv6_egress_rule_name = alicloud_vpc_ipv6_egress_rule.default.ipv6_egress_rule_name
}
