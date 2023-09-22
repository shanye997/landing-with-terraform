data "alicloud_account" "current" {}

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

data "alicloud_dms_user_tenants" "default" {
  status = "ACTIVE"
}

resource "alicloud_dms_enterprise_instance" "default" {
  dba_uid           = tonumber(data.alicloud_account.current.id)
  host              = "${alicloud_db_instance.instance.connection_string}"
  port              = "3306"
  network_type      = "VPC"
  safe_rule         = "自由操作"
  tid               = data.alicloud_dms_user_tenants.default.ids.0
  instance_type     = "mysql"
  instance_source   = "RDS"
  env_type          = "test"
  database_user     = alicloud_db_account.account.name
  database_password = alicloud_db_account.account.password
  instance_alias    = var.name
  query_timeout     = "70"
  export_timeout    = "2000"
  ecs_region        = "cn-hangzhou"
  ddl_online        = "0"
  use_dsql          = "0"
  data_link_name    = ""
}

resource "alicloud_dms_enterprise_proxy" "default" {
  instance_id = alicloud_dms_enterprise_instance.default.instance_id
  password    = var.password_var
  tid         = data.alicloud_dms_user_tenants.default.ids.0
  username    = var.username_var
}
