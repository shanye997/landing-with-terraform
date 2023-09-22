data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 1]
}

resource "alicloud_adb_db_cluster_lake_version" "default" {
  vswitch_id         = data.alicloud_vswitches.default.ids.0
  storage_resource   = var.storage_resource_var
  vpc_id             = data.alicloud_vpcs.default.ids.0
  db_cluster_version = "5.0"
  compute_resource   = var.compute_resource_var
  zone_id            = data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 1]
  payment_type       = "PayAsYouGo"
}
