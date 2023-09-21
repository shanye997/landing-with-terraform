resource "alicloud_eip_address" "default" {
  address_name = "${var.name}"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_vpc_ipv4_gateway" "default" {
  ipv4_gateway_description = var.name
  ipv4_gateway_name        = var.name
  vpc_id                   = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_eip_association" "default" {
  vpc_id        = alicloud_vpc_ipv4_gateway.default.vpc_id
  allocation_id = alicloud_eip_address.default.id
  instance_id   = "192.168.0.1"
  instance_type = "IpAddress"
}
