data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.ids.0
}

resource "alicloud_resource_manager_resource_share" "default" {
  resource_share_name = var.name
}

resource "alicloud_resource_manager_shared_resource" "default" {
  resource_share_id = alicloud_resource_manager_resource_share.default.id
  resource_type     = "VSwitch"
  resource_id       = data.alicloud_vswitches.default.ids.0
}
