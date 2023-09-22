data "alicloud_db_zones" "default" {}

data "alicloud_db_instance_classes" "default" {
  engine         = "MySQL"
  engine_version = "5.6"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids[0]
  zone_id = data.alicloud_db_zones.default.zones[0].id
}

resource "alicloud_db_instance" "default" {
  count            = 2
  engine           = "MySQL"
  engine_version   = "5.6"
  instance_type    = data.alicloud_db_instance_classes.default.instance_classes[0].instance_class
  instance_storage = "10"
  vswitch_id       = data.alicloud_vswitches.default.ids[0]
  instance_name    = join("", [var.name, count.index])
}

resource "alicloud_rds_account" "default" {
  count            = 2
  db_instance_id   = alicloud_db_instance.default[count.index].id
  account_name     = join("", [var.database_name, count.index])
  account_password = var.password
}

resource "alicloud_db_database" "default" {
  count       = 2
  instance_id = alicloud_db_instance.default[count.index].id
  name        = var.database_name
}

resource "alicloud_db_account_privilege" "default" {
  count        = 2
  instance_id  = alicloud_db_instance.default[count.index].id
  account_name = alicloud_rds_account.default[count.index].name
  privilege    = "ReadWrite"
  db_names     = [alicloud_db_database.default[count.index].name]
}

resource "alicloud_dts_migration_instance" "default" {
  payment_type                     = "PayAsYouGo"
  source_endpoint_engine_name      = "MySQL"
  source_endpoint_region           = var.region
  destination_endpoint_engine_name = "MySQL"
  destination_endpoint_region      = var.region
  instance_class                   = "small"
  sync_architecture                = "oneway"
}

resource "alicloud_dts_migration_job" "default" {
  source_endpoint_engine_name      = "MySQL"
  source_endpoint_region           = var.region
  structure_initialization         = "true"
  data_synchronization             = "true"
  status                           = var.status_var
  dts_job_name                     = "tf-examplecn-hangzhoudtsmigrationjob44152"
  destination_endpoint_engine_name = "MySQL"
  depends_on = [
    alicloud_db_account_privilege.default
  ]
  destination_endpoint_region        = var.region
  destination_endpoint_password      = var.password
  source_endpoint_user_name          = alicloud_rds_account.default.0.name
  dts_instance_id                    = alicloud_dts_migration_instance.default.id
  destination_endpoint_instance_id   = alicloud_db_instance.default.1.id
  source_endpoint_instance_type      = "RDS"
  destination_endpoint_instance_type = "RDS"
  db_list                            = "{\"tftestdatabase\":{\"name\":\"tftestdatabase\",\"all\":true}}"
  source_endpoint_instance_id        = alicloud_db_instance.default.0.id
  data_initialization                = "true"
  source_endpoint_password           = var.password
  destination_endpoint_user_name     = alicloud_rds_account.default.1.name
}
