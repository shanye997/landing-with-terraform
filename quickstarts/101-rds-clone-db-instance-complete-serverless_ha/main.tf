data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "cluster"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.zones.0.id
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "cluster"
  db_instance_storage_type = "cloud_essd"
  instance_charge_type     = "PostPaid"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_db_zones.default.ids.0
}

resource "alicloud_db_instance" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  db_instance_storage_type = "cloud_essd"
  instance_type            = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage         = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  vswitch_id               = data.alicloud_vswitches.default.ids.0
  instance_name            = var.name
  zone_id                  = data.alicloud_db_zones.default.ids.0
  zone_id_slave_a          = data.alicloud_db_zones.default.ids.0
  zone_id_slave_b          = data.alicloud_db_zones.default.ids.0
}

resource "alicloud_rds_backup" "default" {
  db_instance_id    = alicloud_db_instance.default.id
  remove_from_state = "true"
}

data "alicloud_vswitches" "vswitche1" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_db_zones.default.ids.1
}

data "alicloud_vswitches" "vswitche2" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_db_zones.default.ids.2
}

resource "alicloud_rds_clone_db_instance" "default" {
  connection_string_prefix = var.connection_string_prefix_var
  serverless_config {
    max_capacity = "6"
    min_capacity = "3"
  }

  port                  = var.port_var
  vswitch_id            = join(",", [data.alicloud_vswitches.vswitche1.ids.0, data.alicloud_vswitches.vswitche2.ids.0])
  zone_id_slave_b       = alicloud_db_instance.default.zone_id_slave_b
  ssl_enabled           = var.ssl_enabled_var
  replication_acl       = var.replication_acl_var
  client_ca_enabled     = var.client_ca_enabled_var
  zone_id_slave_a       = alicloud_db_instance.default.zone_id_slave_a
  vpc_id                = alicloud_db_instance.default.vpc_id
  client_ca_cert        = var.client_ca_cert_var
  zone_id               = alicloud_db_instance.default.zone_id
  backup_id             = alicloud_rds_backup.default.backup_id
  category              = "serverless_ha"
  ca_type               = var.ca_type_var
  source_db_instance_id = alicloud_db_instance.default.id
  db_instance_class     = data.alicloud_db_instance_classes.default.instance_classes.1.instance_class
  payment_type          = var.payment_type_var
  instance_network_type = "VPC"
  security_ips = [
    "10.168.1.12",
    "100.69.7.112"
  ]
  deletion_protection         = var.deletion_protection_var
  db_instance_description     = var.db_instance_description_var
  client_cert_revocation_list = var.client_cert_revocation_list_var
  db_instance_storage_type    = var.db_instance_storage_type_var
  tcp_connection_type         = var.tcp_connection_type_var
  client_crl_enabled          = var.client_crl_enabled_var
  maintain_time               = var.maintain_time_var
  auto_upgrade_minor_version  = var.auto_upgrade_minor_version_var
  db_instance_storage         = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min + data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.step
  acl                         = var.acl_var
}
