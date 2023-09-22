provider "alicloud" {
  alias  = "local"
  region = "cn-hangzhou"
}

data "alicloud_vpcs" "default" {
  provider   = alicloud.local
  name_regex = "default-NODELETING"
}

data "alicloud_vpcs" "default1" {
  provider   = alicloud.accepting
  name_regex = "default-NODELETING"
}

resource "alicloud_vpc_peer_connection" "default" {
  accepting_vpc_id    = data.alicloud_vpcs.default1.ids.0
  vpc_id              = data.alicloud_vpcs.default.ids.0
  provider            = "alicloud.local"
  accepting_region_id = var.accepting_region
}
