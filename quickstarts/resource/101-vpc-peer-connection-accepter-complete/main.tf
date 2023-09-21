data "alicloud_account" "default" {}

provider "alicloud" {
  alias  = "local"
  region = "cn-hangzhou"
}

data "alicloud_vpcs" "default" {
  provider   = alicloud.local
  name_regex = "default-NODELETING"
}

data "alicloud_vpcs" "defaultone" {
  provider   = alicloud.accepting
  name_regex = "default-NODELETING"
}

resource "alicloud_vpc_peer_connection" "default" {
  peer_connection_name = var.name
  vpc_id               = data.alicloud_vpcs.default.ids.0
  accepting_ali_uid    = data.alicloud_account.default.id
  accepting_region_id  = var.accepting_region
  accepting_vpc_id     = data.alicloud_vpcs.defaultone.ids.0
  description          = var.name
  provider             = alicloud.local
}

resource "alicloud_vpc_peer_connection_accepter" "default" {
  instance_id = alicloud_vpc_peer_connection.default.id
}
