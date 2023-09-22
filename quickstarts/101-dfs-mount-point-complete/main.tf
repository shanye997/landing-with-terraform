data "alicloud_dfs_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_dfs_zones.default.zones.0.zone_id
}

resource "alicloud_vswitch" "default" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 2)
  zone_id      = data.alicloud_dfs_zones.default.zones.0.zone_id
  vswitch_name = var.name
}

locals {
  vpc_id     = data.alicloud_vpcs.default.ids.0
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.default.*.id, [""])[0]
}

resource "alicloud_dfs_file_system" "default" {
  storage_type     = data.alicloud_dfs_zones.default.zones.0.options.0.storage_type
  zone_id          = data.alicloud_dfs_zones.default.zones.0.zone_id
  protocol_type    = "HDFS"
  description      = var.name
  file_system_name = var.name
  throughput_mode  = "Standard"
  space_capacity   = "1024"
}

resource "alicloud_dfs_access_group" "default" {
  count             = 2
  network_type      = "VPC"
  access_group_name = join("", [var.name, count.index])
  description       = var.name
}

resource "alicloud_dfs_mount_point" "default" {
  status          = var.status_var
  vpc_id          = local.vpc_id
  vswitch_id      = local.vswitch_id
  access_group_id = alicloud_dfs_access_group.default[0].id
  description     = var.description_var
  file_system_id  = alicloud_dfs_file_system.default.id
  network_type    = "VPC"
}
