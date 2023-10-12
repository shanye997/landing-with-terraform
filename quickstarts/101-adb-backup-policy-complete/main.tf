data "alicloud_adb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_adb_zones.default.ids.0
}

locals {
  vswitch_id = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_adb_db_cluster" "default" {
  db_cluster_category = "MixedStorage"
  mode                = "flexible"
  compute_resource    = "8Core32GB"
  vswitch_id          = local.vswitch_id
  description         = "${var.name}"
}

resource "alicloud_adb_backup_policy" "default" {
  preferred_backup_time = var.preferred_backup_time_var
  db_cluster_id         = alicloud_adb_db_cluster.default.id
  preferred_backup_period = [
    "Tuesday",
    "Thursday",
    "Friday",
    "Sunday"
  ]
}
