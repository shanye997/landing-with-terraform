data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "HighAvailability"
  db_instance_storage_type = "local_ssd"
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.zones.0.id
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "HighAvailability"
  db_instance_storage_type = "local_ssd"
  instance_charge_type     = "PostPaid"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_db_zones.default.zones.0.id
}

resource "alicloud_vswitch" "this" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_db_zones.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 8, 4)
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.this.*.id, [""])[0]
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_db_instance" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  db_instance_storage_type = "local_ssd"
  instance_type            = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage         = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  vswitch_id               = local.vswitch_id
  instance_name            = var.name
  security_group_ids       = alicloud_security_group.default.*.id
}

resource "alicloud_db_backup_policy" "default" {
  archive_backup_retention_period = var.archive_backup_retention_period_var
  local_log_retention_hours       = var.local_log_retention_hours_var
  released_keep_policy            = var.released_keep_policy_var
  compress_type                   = var.compress_type_var
  preferred_backup_period = [
    "Tuesday",
    "Monday",
    "Wednesday"
  ]
  local_log_retention_space   = var.local_log_retention_space_var
  category                    = var.category_var
  log_backup_frequency        = var.log_backup_frequency_var
  instance_id                 = alicloud_db_instance.default.id
  archive_backup_keep_policy  = var.archive_backup_keep_policy_var
  enable_backup_log           = var.enable_backup_log_var
  backup_interval             = var.backup_interval_var
  log_backup_retention_period = var.log_backup_retention_period_var
  archive_backup_keep_count   = var.archive_backup_keep_count_var
  backup_retention_period     = var.backup_retention_period_var
  preferred_backup_time       = var.preferred_backup_time_var
  high_space_usage_protection = var.high_space_usage_protection_var
}
