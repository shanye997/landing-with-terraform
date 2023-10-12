data "alicloud_mongodb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_mongodb_zones.default.zones.0.id
}

resource "alicloud_vswitch" "default" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_mongodb_zones.default.zones.0.id
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.default.*.id, [""])[0]
}

resource "alicloud_mongodb_serverless_instance" "default" {
  engine_version      = var.engine_version_var
  vswitch_id          = local.vswitch_id
  zone_id             = data.alicloud_mongodb_zones.default.zones.0.id
  capacity_unit       = var.capacity_unit_var
  vpc_id              = data.alicloud_vpcs.default.ids.0
  db_instance_storage = var.db_instance_storage_var
  account_password    = var.account_password_var
}
