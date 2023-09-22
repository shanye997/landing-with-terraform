data "alicloud_account" "current" {
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
  name_regex = "^default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_db_zones.default.zones.0.id
}

resource "alicloud_db_instance" "instance" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  db_instance_storage_type = "cloud_essd"
  instance_type            = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage         = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  vswitch_id               = data.alicloud_vswitches.default.ids.0
  instance_name            = var.name
  security_ips             = ["100.104.5.0/24", "192.168.0.6"]
  tags = {
    "key1" = "value1"
    "key2" = "value2"
  }
}

resource "alicloud_db_account" "account" {
  instance_id = "${alicloud_db_instance.instance.id}"
  name        = "tftestnormal"
  password    = "Test12345"
  type        = "Normal"
}

resource "alicloud_dms_enterprise_instance" "default" {
  instance_source   = var.instance_source_var
  env_type          = var.env_type_var
  database_user     = alicloud_db_account.account.name
  query_timeout     = var.query_timeout_var
  safe_rule         = "自由操作"
  host              = alicloud_db_instance.instance.connection_string
  network_type      = "VPC"
  port              = "3306"
  export_timeout    = var.export_timeout_var
  instance_type     = var.instance_type_var
  dba_uid           = tonumber(data.alicloud_account.current.id)
  database_password = alicloud_db_account.account.password
}
