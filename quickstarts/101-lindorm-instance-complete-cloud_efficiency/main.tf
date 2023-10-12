data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

data "alicloud_vswitches" "arbitervswitchid" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.1.id
}

data "alicloud_vswitches" "standbyvswitchid" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.2.id
}

resource "alicloud_lindorm_instance" "default_2" {
  instance_storage              = var.instance_storage_var
  disk_category                 = "cloud_efficiency"
  arch_version                  = var.arch_version_var
  standby_zone_id               = data.alicloud_zones.default.zones.2.id
  core_single_storage           = var.core_single_storage_var
  zone_id                       = data.alicloud_zones.default.zones.0.id
  deletion_proection            = var.deletion_proection_var
  time_series_engine_node_count = var.time_series_engine_node_count_var
  search_engine_specification   = var.search_engine_specification_var
  file_engine_specification     = var.file_engine_specification_var
  table_engine_node_count       = var.table_engine_node_count_var
  primary_zone_id               = data.alicloud_zones.default.zones.0.id
  standby_vswitch_id            = data.alicloud_vswitches.standbyvswitchid.ids[0]
  ip_white_list = [
    "117.117.117.117",
    "116.116.116.116"
  ]
  arbiter_zone_id                  = data.alicloud_zones.default.zones.1.id
  primary_vswitch_id               = data.alicloud_vswitches.default.ids[0]
  search_engine_node_count         = var.search_engine_node_count_var
  table_engine_specification       = var.table_engine_specification_var
  arbiter_vswitch_id               = data.alicloud_vswitches.arbitervswitchid.ids[0]
  log_disk_category                = "cloud_efficiency"
  payment_type                     = "PayAsYouGo"
  log_num                          = var.log_num_var
  file_engine_node_count           = var.file_engine_node_count_var
  log_spec                         = var.log_spec_var
  multi_zone_combination           = "ap-southeast-1-abc-aliyun"
  time_series_engine_specification = var.time_series_engine_specification_var
  vswitch_id                       = data.alicloud_vswitches.default.ids[0]
  instance_name                    = var.name
  log_single_storage               = var.log_single_storage_var
  vpc_id                           = data.alicloud_vpcs.default.ids.0
}
