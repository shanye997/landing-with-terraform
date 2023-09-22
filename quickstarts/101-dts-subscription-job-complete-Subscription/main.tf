data "alicloud_db_zones" "default" {
  engine               = "MySQL"
  engine_version       = "5.6"
  instance_charge_type = "PostPaid"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
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
  source_endpoint_instance_id   = alicloud_db_instance.instance.id
  source_endpoint_instance_type = var.source_endpoint_instance_type_var
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
  source_endpoint_database_name      = var.source_endpoint_database_name_var
  source_endpoint_region             = var.source_endpoint_region_var
  payment_type                       = "Subscription"
  subscription_instance_network_type = "classic"
  payment_duration                   = var.payment_duration_var
  payment_duration_unit              = var.payment_duration_unit_var
  source_endpoint_engine_name        = var.source_endpoint_engine_name_var
  source_endpoint_password           = var.source_endpoint_password_var
  source_endpoint_user_name          = var.source_endpoint_user_name_var
  db_list                            = var.db_list_var
  dts_job_name                       = var.dts_job_name_var
}
