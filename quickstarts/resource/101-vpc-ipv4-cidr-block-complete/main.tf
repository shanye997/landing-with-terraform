data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_vpc_ipv4_cidr_block" "default" {
  secondary_cidr_block = "192.163.0.0/16"
  vpc_id               = data.alicloud_vpcs.default.ids.0
}
