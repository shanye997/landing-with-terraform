data "alicloud_dfs_zones" "default" {}

locals {
  zone_id      = data.alicloud_dfs_zones.default.zones.0.zone_id
  storage_type = data.alicloud_dfs_zones.default.zones.0.options.0.storage_type
}

resource "alicloud_dfs_file_system" "default" {
  file_system_name = var.file_system_name_var
  storage_type     = local.storage_type
  zone_id          = local.zone_id
  protocol_type    = "HDFS"
  space_capacity   = var.space_capacity_var
}
