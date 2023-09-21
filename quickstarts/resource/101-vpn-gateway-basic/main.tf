data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

resource "alicloud_vpn_gateway" "default" {
  vpc_id    = data.alicloud_vpcs.default.ids.0
  bandwidth = "10"
}
