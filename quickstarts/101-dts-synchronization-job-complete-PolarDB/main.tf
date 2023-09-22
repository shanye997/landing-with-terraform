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

data "alicloud_polardb_node_classes" "default" {
  db_type    = "MySQL"
  db_version = "5.6"
  pay_type   = "PostPaid"
  zone_id    = data.alicloud_db_zones.default.zones.0.id
}

## PolarDB PolarDB Source
resource "alicloud_polardb_cluster" "source" {
  db_type       = "MySQL"
  db_version    = "5.6"
  pay_type      = "PostPaid"
  db_node_class = data.alicloud_polardb_node_classes.default.classes.0.supported_engines.0.available_resources.0.db_node_class
  vswitch_id    = data.alicloud_vswitches.default.ids.0
  description   = "polardb_cluster_description"
}

resource "alicloud_polardb_account" "source_account" {
  db_cluster_id    = alicloud_polardb_cluster.source.id
  account_name     = "test_polardb"
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
  source_endpoint_engine_name      = "PolarDB"
  source_endpoint_region           = var.region_id
  destination_endpoint_engine_name = "MySQL"
  destination_endpoint_region      = var.region_id
  instance_class                   = "small"
  sync_architecture                = "oneway"
}

resource "alicloud_dts_synchronization_job" "default" {
  destination_endpoint_database_name = "test_database"
  destination_endpoint_instance_id   = alicloud_db_instance.target.id
  destination_endpoint_password      = alicloud_rds_account.target_account.account_password
  destination_endpoint_user_name     = alicloud_rds_account.target_account.account_name
  dts_instance_id                    = alicloud_dts_synchronization_instance.default.id
  source_endpoint_instance_id        = alicloud_polardb_cluster.source.id
  source_endpoint_password           = alicloud_polardb_account.source_account.account_password
  data_initialization                = "true"
  source_endpoint_region             = var.region_id
  source_endpoint_database_name      = "test_database"
  source_endpoint_instance_type      = "PolarDB"
  source_endpoint_user_name          = alicloud_polardb_account.source_account.account_name
  structure_initialization           = "true"
  db_list                            = var.db_list_var
  destination_endpoint_engine_name   = "MySQL"
  destination_endpoint_region        = var.region_id
  dts_job_name                       = var.dts_job_name_var
  source_endpoint_engine_name        = "PolarDB"
  data_synchronization               = "true"
  destination_endpoint_instance_type = "RDS"
}
