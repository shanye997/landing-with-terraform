data "alicloud_db_zones" "default" {
  engine               = "MySQL"
  engine_version       = "5.6"
  instance_charge_type = "PostPaid"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids[0]
  zone_id = data.alicloud_db_zones.default.zones.0.id
}

data "alicloud_db_instance_classes" "default" {
  zone_id              = data.alicloud_db_zones.default.zones.0.id
  engine               = "MySQL"
  engine_version       = "5.6"
  instance_charge_type = "PostPaid"
}

resource "alicloud_db_instance" "instance" {
  engine           = "MySQL"
  engine_version   = "5.6"
  instance_type    = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  vswitch_id       = data.alicloud_vswitches.default.ids.0
  instance_name    = var.name
}

resource "alicloud_dts_subscription_job" "default" {
  dts_job_name                       = var.name
  payment_type                       = "PayAsYouGo"
  source_endpoint_engine_name        = "MySQL"
  source_endpoint_region             = var.region_id
  source_endpoint_instance_type      = "RDS"
  source_endpoint_instance_id        = alicloud_db_instance.instance.id
  source_endpoint_database_name      = "tfaccountpri_0"
  source_endpoint_user_name          = "tftestprivilege"
  source_endpoint_password           = "Test12345"
  db_list                            = <<EOF
        {"dtstestdata": {"name": "tfaccountpri_0", "all": true}}
    EOF
  subscription_instance_network_type = "vpc"
  subscription_instance_vpc_id       = data.alicloud_vpcs.default.ids[0]
  subscription_instance_vswitch_id   = data.alicloud_vswitches.default.ids[0]
  status                             = "Normal"
}

resource "alicloud_dts_job_monitor_rule" "default" {
  type       = "delay"
  dts_job_id = alicloud_dts_subscription_job.default.id
}
