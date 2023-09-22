data "alicloud_dfs_zones" "default" {}

locals {
  zone_id      = data.alicloud_dfs_zones.default.zones.0.zone_id
  storage_type = data.alicloud_dfs_zones.default.zones.0.options.0.storage_type
}

resource "alicloud_dfs_file_system" "default" {
  protocol_type                    = "HDFS"
  provisioned_throughput_in_mi_bps = "512"
  space_capacity                   = var.space_capacity_var
  storage_type                     = local.storage_type
  throughput_mode                  = var.throughput_mode_var
  zone_id                          = local.zone_id
  description                      = var.description_var
  file_system_name                 = var.file_system_name_var
}
