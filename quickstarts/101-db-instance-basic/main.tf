data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.zones.0.id
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
  instance_charge_type     = "PostPaid"
}

resource "alicloud_db_instance" "default" {
  instance_storage = var.instance_storage_var
  engine_version   = var.engine_version_var
  parameters {
    name  = "delayed_insert_timeout"
    value = "70"
  }

  instance_type = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  pg_hba_conf {
    address     = "0.0.0.0/0"
    database    = "all"
    method      = "md5"
    priority_id = "0"
    type        = "host"
    user        = "all"
  }

  babelfish_config {
    migration_mode       = "single-db"
    babelfish_enabled    = "true"
    master_user_password = "test_123456"
    master_username      = "test01"
  }

  serverless_config {
    max_capacity = "6"
    min_capacity = "2"
  }

  engine = "PostgreSQL"
}
