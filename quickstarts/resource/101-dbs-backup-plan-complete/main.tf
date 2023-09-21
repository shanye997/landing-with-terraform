data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "HighAvailability"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.zones.0.id
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "HighAvailability"
  db_instance_storage_type = "cloud_essd"
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

resource "alicloud_db_instance" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  db_instance_storage_type = "cloud_essd"
  instance_type            = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage         = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  vswitch_id               = local.vswitch_id
  instance_name            = var.name
}

resource "alicloud_db_database" "default" {
  instance_id = alicloud_db_instance.default.id
  name        = "tftestdatabase"
}

resource "alicloud_rds_account" "default" {
  db_instance_id   = alicloud_db_instance.default.id
  account_name     = "tftestnormal000"
  account_password = "Test12345"
}

resource "alicloud_db_account_privilege" "default" {
  instance_id  = alicloud_db_instance.default.id
  account_name = alicloud_rds_account.default.account_name
  privilege    = "ReadWrite"
  db_names     = [alicloud_db_database.default.name]
}

resource "alicloud_dbs_backup_plan" "default" {
  source_endpoint_instance_id   = alicloud_db_instance.default.id
  storage_region                = var.storage_region
  backup_retention_period       = "740"
  source_endpoint_instance_type = "RDS"
  source_endpoint_password      = alicloud_rds_account.default.account_password
  backup_plan_name              = var.name
  instance_class                = "xlarge"
  backup_objects                = "[{\"DBName\":\"${alicloud_db_database.default.name}\"}]"
  resource_group_id             = data.alicloud_resource_manager_resource_groups.default.ids.0
  status                        = var.status_var
  instance_type                 = var.instance_type_var
  backup_period                 = "Monday"
  backup_method                 = "logical"
  backup_storage_type           = "system"
  payment_type                  = "PayAsYouGo"
  source_endpoint_region        = var.source_endpoint_region
  source_endpoint_user_name     = alicloud_db_account_privilege.default.account_name
  database_region               = var.database_region
  backup_start_time             = "14:22"
  database_type                 = "MySQL"
}
