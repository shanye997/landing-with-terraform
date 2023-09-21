data "alicloud_instances" "default" {
  name_regex = "no-deleteing-ipv6-address"
  status     = "Running"
}

data "alicloud_vpcs" "default" {
  name_regex = "no-deleteing-ipv6-address"
}

data "alicloud_vpc_ipv6_addresses" "default" {
  associated_instance_id = "${data.alicloud_instances.default.instances.0.id}_fake"
  status                 = "Pending"
  vpc_id                 = "${data.alicloud_vpcs.default.ids.0}_fake"
  vswitch_id             = "${data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0}_fake"
}
