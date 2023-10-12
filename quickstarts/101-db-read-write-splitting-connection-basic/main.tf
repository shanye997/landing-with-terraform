data "alicloud_db_zones" "default" {
  engine                   = "SQLServer"
  engine_version           = "2017_ent"
  instance_charge_type     = "PostPaid"
  db_instance_storage_type = "cloud_essd"
  category                 = "AlwaysOn"
}

data "alicloud_db_instance_classes" "master" {
  zone_id                  = data.alicloud_db_zones.default.zones.0.id
  engine                   = "SQLServer"
  engine_version           = "2017_ent"
  db_instance_storage_type = "cloud_essd"
  instance_charge_type     = "PostPaid"
  category                 = "AlwaysOn"
}

data "alicloud_vswitches" "default" {
  zone_id = data.alicloud_db_zones.default.zones.0.id
}

resource "alicloud_db_instance" "default" {
  engine                   = "SQLServer"
  engine_version           = "2017_ent"
  db_instance_storage_type = "cloud_essd"
  instance_type            = data.alicloud_db_instance_classes.master.instance_classes.0.instance_class
  instance_storage         = data.alicloud_db_instance_classes.master.instance_classes.0.storage_range.min
  vswitch_id               = data.alicloud_vswitches.default.vswitches.0.vswitch_id
  instance_name            = var.name
}

resource "alicloud_db_readonly_instance" "default" {
  zone_id               = alicloud_db_instance.default.zone_id
  master_db_instance_id = alicloud_db_instance.default.id
  engine_version        = alicloud_db_instance.default.engine_version
  instance_storage      = alicloud_db_instance.default.instance_storage
  instance_type         = "rds.mssql.s2.large"
  instance_name         = "${var.name}_ro"
  vswitch_id            = data.alicloud_vswitches.default.vswitches.0.vswitch_id
}

resource "alicloud_db_read_write_splitting_connection" "create" {
  instance_id       = alicloud_db_readonly_instance.default.master_db_instance_id
  distribution_type = var.distribution_type_var
}
