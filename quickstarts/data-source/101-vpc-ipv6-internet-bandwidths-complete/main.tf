data "alicloud_instances" "default" {
  name_regex = "no-deleteing-ipv6-address"
  status     = "Running"
}

data "alicloud_vpc_ipv6_addresses" "default" {
  associated_instance_id = data.alicloud_instances.default.instances.0.id
  status                 = "Available"
}

resource "alicloud_vpc_ipv6_internet_bandwidth" "default" {
  ipv6_address_id      = data.alicloud_vpc_ipv6_addresses.default.addresses.0.id
  ipv6_gateway_id      = data.alicloud_vpc_ipv6_addresses.default.addresses.0.ipv6_gateway_id
  internet_charge_type = "PayByBandwidth"
  bandwidth            = "20"
}

data "alicloud_vpc_ipv6_internet_bandwidths" "default" {
  ids = [
    alicloud_vpc_ipv6_internet_bandwidth.default.id
  ]
  ipv6_address_id            = "${alicloud_vpc_ipv6_internet_bandwidth.default.ipv6_address_id}_fake"
  ipv6_internet_bandwidth_id = "${alicloud_vpc_ipv6_internet_bandwidth.default.id}_fake"
  status                     = "FinacialLocked"
}
