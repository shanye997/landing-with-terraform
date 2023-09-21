resource "alicloud_vpc" "default" {
  vpc_name    = var.name
  enable_ipv6 = "true"
}

resource "alicloud_vpc_ipv6_gateway" "default" {
  vpc_id            = alicloud_vpc.default.id
  ipv6_gateway_name = var.name
  description       = var.name
}

data "alicloud_vpc_ipv6_gateways" "default" {
  status = "Deleting"
  vpc_id = "${alicloud_vpc_ipv6_gateway.default.vpc_id}-fake"
  ids = [
    alicloud_vpc_ipv6_gateway.default.id
  ]
  ipv6_gateway_name = "${alicloud_vpc_ipv6_gateway.default.ipv6_gateway_name}-fake"
  name_regex        = "${alicloud_vpc_ipv6_gateway.default.ipv6_gateway_name}-fake"
}
