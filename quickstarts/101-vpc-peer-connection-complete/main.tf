data "alicloud_account" "default" {}

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

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_vpc_peer_connection" "default" {
  resource_group_id    = data.alicloud_resource_manager_resource_groups.default.groups.1.id
  accepting_region_id  = var.accepting_region
  description          = var.name
  provider             = "alicloud.local"
  bandwidth            = var.bandwidth_var
  peer_connection_name = var.name
  tags = {
    Created = "TF"
    For     = "Test"
  }
  vpc_id            = data.alicloud_vpcs.default.ids.0
  accepting_ali_uid = data.alicloud_account.default.id
  accepting_vpc_id  = data.alicloud_vpcs.default1.ids.0
}
