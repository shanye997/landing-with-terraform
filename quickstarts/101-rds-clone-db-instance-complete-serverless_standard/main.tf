data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "Serverless"
  category                 = "serverless_standard"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.ids.1
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "serverless_standard"
  db_instance_storage_type = "cloud_essd"
  instance_charge_type     = "Serverless"
  commodity_code           = "rds_serverless_public_cn"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "vswitche1" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_db_zones.default.ids.0
}

data "alicloud_vswitches" "vswitche2" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_db_zones.default.ids.1
}

resource "alicloud_db_instance" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_storage         = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  instance_type            = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_charge_type     = "Serverless"
  instance_name            = var.name
  zone_id                  = data.alicloud_db_zones.default.ids.0
  zone_id_slave_a          = data.alicloud_db_zones.default.ids.1
  vswitch_id               = join(",", [data.alicloud_vswitches.vswitche1.ids.0, data.alicloud_vswitches.vswitche2.ids.0])
  db_instance_storage_type = "cloud_essd"
  category                 = "serverless_standard"
  serverless_config {
    max_capacity = 8
    min_capacity = 0.5
    auto_pause   = false
    switch_force = false
  }
}

resource "alicloud_rds_backup" "default" {
  db_instance_id    = alicloud_db_instance.default.id
  remove_from_state = "true"
}

resource "alicloud_rds_clone_db_instance" "default" {
  source_db_instance_id   = alicloud_db_instance.default.id
  deletion_protection     = var.deletion_protection_var
  db_instance_description = var.db_instance_description_var
  serverless_config {
    switch_force = false
    auto_pause   = false
    max_capacity = "7"
    min_capacity = "1.5"
  }

  category              = "serverless_standard"
  zone_id_slave_a       = alicloud_db_instance.default.zone_id_slave_a
  instance_network_type = "VPC"
  zone_id               = alicloud_db_instance.default.zone_id
  port                  = var.port_var
  pg_hba_conf {
    priority_id = "0"
    type        = "host"
    user        = "all"
    address     = "0.0.0.0/0"
    database    = "all"
    method      = "md5"
  }

  security_ips = [
    "10.168.1.12",
    "100.69.7.112"
  ]
  backup_id                = alicloud_rds_backup.default.backup_id
  db_instance_storage      = alicloud_db_instance.default.instance_storage
  db_instance_storage_type = var.db_instance_storage_type_var
  vpc_id                   = alicloud_db_instance.default.vpc_id
  vswitch_id               = join(",", [data.alicloud_vswitches.vswitche1.ids.0, data.alicloud_vswitches.vswitche2.ids.0])
  db_instance_class        = alicloud_db_instance.default.instance_type
  payment_type             = var.payment_type_var
  connection_string_prefix = var.name
}
