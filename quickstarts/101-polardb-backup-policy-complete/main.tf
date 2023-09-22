data "alicloud_polardb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  zone_id = local.zone_id
  vpc_id  = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_vswitch" "this" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = "tf_examplePolarDB"
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_polardb_zones.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 8, 4)
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.this.*.id, [""])[0]
  zone_id    = data.alicloud_polardb_zones.default.ids[length(data.alicloud_polardb_zones.default.ids) - 1]
}

data "alicloud_polardb_node_classes" "this" {
  db_type    = "MySQL"
  db_version = "8.0"
  pay_type   = "PostPaid"
  zone_id    = local.zone_id
  category   = "Normal"
}

resource "alicloud_polardb_cluster" "default" {
  db_type       = "MySQL"
  db_version    = "8.0"
  pay_type      = "PostPaid"
  db_node_class = data.alicloud_polardb_node_classes.this.classes.0.supported_engines.0.available_resources.0.db_node_class
  vswitch_id    = local.vswitch_id
  description   = "${var.name}"
}

resource "alicloud_polardb_backup_policy" "default" {
  preferred_backup_period = [
    "Tuesday",
    "Wednesday"
  ]
  log_backup_another_region_region         = var.log_backup_another_region_region_var
  db_cluster_id                            = alicloud_polardb_cluster.default.id
  data_level2_backup_another_region_region = var.data_level2_backup_another_region_region_var
  data_level2_backup_period = [
    "Tuesday",
    "Wednesday"
  ]
  data_level1_backup_retention_period = var.data_level1_backup_retention_period_var
  data_level1_backup_period = [
    "Tuesday",
    "Wednesday"
  ]
  data_level2_backup_another_region_retention_period = var.data_level2_backup_another_region_retention_period_var
  log_backup_retention_period                        = var.log_backup_retention_period_var
  backup_frequency                                   = var.backup_frequency_var
  backup_retention_policy_on_cluster_deletion        = var.backup_retention_policy_on_cluster_deletion_var
  log_backup_another_region_retention_period         = var.log_backup_another_region_retention_period_var
  data_level2_backup_retention_period                = var.data_level2_backup_retention_period_var
  data_level1_backup_frequency                       = var.data_level1_backup_frequency_var
  data_level1_backup_time                            = var.data_level1_backup_time_var
  preferred_backup_time                              = var.preferred_backup_time_var
}
