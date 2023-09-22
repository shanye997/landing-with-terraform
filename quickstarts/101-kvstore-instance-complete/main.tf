data "alicloud_kvstore_zones" "default" {
  instance_charge_type = "PostPaid"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_vswitches" "update" {
  zone_id = data.alicloud_kvstore_zones.default.zones[length(data.alicloud_kvstore_zones.default.ids) - 2].id
  vpc_id  = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_kvstore_instance" "default" {
  engine_version = var.engine_version_var
  config = {

  }
  backup_period = [
    "Tuesday",
    "Wednesday"
  ]
  security_ips = [
    "10.23.12.24"
  ]
  instance_class = var.instance_class_var
  shard_count    = "2"
  tags = {
    Created = "TF"
    For     = "kvstore"
  }
  instance_type               = "Redis"
  tde_status                  = var.tde_status_var
  private_connection_prefix   = var.private_connection_prefix_var
  auto_renew_period           = var.auto_renew_period_var
  vswitch_id                  = data.alicloud_vswitches.update.ids.0
  backup_time                 = var.backup_time_var
  period                      = var.period_var
  payment_type                = var.payment_type_var
  secondary_zone_id           = data.alicloud_kvstore_zones.default.zones[length(data.alicloud_kvstore_zones.default.ids) - 1].id
  resource_group_id           = data.alicloud_resource_manager_resource_groups.default.ids.1
  maintain_start_time         = var.maintain_start_time_var
  auto_renew                  = var.auto_renew_var
  private_connection_port     = var.private_connection_port_var
  zone_id                     = data.alicloud_kvstore_zones.default.zones[length(data.alicloud_kvstore_zones.default.ids) - 2].id
  maintain_end_time           = var.maintain_end_time_var
  vpc_auth_mode               = var.vpc_auth_mode_var
  db_instance_name            = var.db_instance_name_var
  instance_release_protection = var.instance_release_protection_var
}
