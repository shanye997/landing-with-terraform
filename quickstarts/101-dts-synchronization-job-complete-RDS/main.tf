data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "HighAvailability"
  db_instance_storage_type = "local_ssd"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_db_zones.default.zones.0.id
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.zones.0.id
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "HighAvailability"
  db_instance_storage_type = "local_ssd"
  instance_charge_type     = "PostPaid"
}

## RDS MySQL Source
resource "alicloud_db_instance" "source" {
  engine           = "MySQL"
  engine_version   = "8.0"
  instance_type    = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  vswitch_id       = data.alicloud_vswitches.default.ids.0
  instance_name    = "rds-mysql-source"
}

resource "alicloud_rds_account" "source_account" {
  db_instance_id   = alicloud_db_instance.source.id
  account_name     = "test_mysql"
  account_password = "N1cetest"
}

## RDS MySQL Target
resource "alicloud_db_instance" "target" {
  engine           = "MySQL"
  engine_version   = "8.0"
  instance_type    = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  vswitch_id       = data.alicloud_vswitches.default.ids.0
  instance_name    = "rds-mysql-target"
}

resource "alicloud_rds_account" "target_account" {
  db_instance_id   = alicloud_db_instance.target.id
  account_name     = "test_mysql"
  account_password = "N1cetest"
}

## DTS Data Synchronization
resource "alicloud_dts_synchronization_instance" "default" {
  payment_type                     = "PayAsYouGo"
  source_endpoint_engine_name      = "MySQL"
  source_endpoint_region           = var.region_id
  destination_endpoint_engine_name = "MySQL"
  destination_endpoint_region      = var.region_id
  instance_class                   = "small"
  sync_architecture                = "oneway"
}

resource "alicloud_dts_synchronization_job" "default" {
  data_initialization                = "true"
  destination_endpoint_database_name = "test_database"
  destination_endpoint_user_name     = alicloud_rds_account.target_account.account_name
  destination_endpoint_instance_id   = alicloud_db_instance.target.id
  dts_job_name                       = var.dts_job_name_var
  db_list                            = var.db_list_var
  source_endpoint_region             = var.region_id
  destination_endpoint_password      = alicloud_rds_account.target_account.account_password
  source_endpoint_database_name      = "test_database"
  source_endpoint_engine_name        = "MySQL"
  source_endpoint_password           = alicloud_rds_account.source_account.account_password
  source_endpoint_instance_type      = "RDS"
  source_endpoint_instance_id        = alicloud_db_instance.source.id
  data_synchronization               = "true"
  destination_endpoint_region        = var.region_id
  destination_endpoint_instance_type = "RDS"
  destination_endpoint_engine_name   = "MySQL"
  status                             = var.status_var
  structure_initialization           = "true"
  source_endpoint_user_name          = alicloud_rds_account.source_account.account_name
  dts_instance_id                    = alicloud_dts_synchronization_instance.default.id
}
