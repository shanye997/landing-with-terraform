data "alicloud_db_zones" "default" {
  engine                   = "PostgreSQL"
  engine_version           = "13.0"
  instance_charge_type     = "PostPaid"
  category                 = "HighAvailability"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.zones.0.id
  engine                   = "PostgreSQL"
  engine_version           = "13.0"
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

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_db_instance" "default" {
  engine                   = "PostgreSQL"
  engine_version           = "13.0"
  db_instance_storage_type = "cloud_essd"
  instance_type            = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage         = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  vswitch_id               = data.alicloud_vswitches.default.ids.0
  instance_name            = var.name
}

resource "alicloud_rds_upgrade_db_instance" "default" {
  acl = var.acl_var
  security_ips = [
    "10.168.1.12",
    "100.69.7.112"
  ]
  port                  = var.port_var
  replication_acl       = var.replication_acl_var
  vpc_id                = data.alicloud_vpcs.default.ids.0
  zone_id_slave_1       = data.alicloud_db_zones.default.zones.0.id
  instance_network_type = "VPC"
  client_ca_cert        = var.client_ca_cert_var
  source_db_instance_id = alicloud_db_instance.default.id
  target_major_version  = "14.0"
  ssl_enabled           = var.ssl_enabled_var
  switch_over           = var.switch_over_var
  resource_group_id     = data.alicloud_resource_manager_resource_groups.default.ids.0
  collect_stat_mode     = var.collect_stat_mode_var
  client_ca_enabled     = var.client_ca_enabled_var
  db_instance_class     = data.alicloud_db_instance_classes.default.instance_classes.1.instance_class
  payment_type          = var.payment_type_var
  db_instance_storage   = alicloud_db_instance.default.instance_storage
  pg_hba_conf {
    database    = "all"
    method      = "md5"
    priority_id = "0"
    type        = "host"
    user        = "all"
    address     = "0.0.0.0/0"
  }

  client_crl_enabled          = var.client_crl_enabled_var
  vswitch_id                  = alicloud_db_instance.default.vswitch_id
  connection_string_prefix    = var.name
  deletion_protection         = var.deletion_protection_var
  tcp_connection_type         = var.tcp_connection_type_var
  zone_id                     = data.alicloud_db_zones.default.zones.0.id
  switch_time_mode            = var.switch_time_mode_var
  db_instance_description     = var.db_instance_description_var
  ca_type                     = var.ca_type_var
  client_cert_revocation_list = var.client_cert_revocation_list_var
  db_instance_storage_type    = var.db_instance_storage_type_var
}
