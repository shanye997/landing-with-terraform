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

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_db_instance" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  db_instance_storage_type = "cloud_essd"
  instance_type            = data.alicloud_db_instance_classes.default.instance_classes.28.instance_class
  instance_storage         = data.alicloud_db_instance_classes.default.instance_classes.28.storage_range.min
  vswitch_id               = data.alicloud_vswitches.default.ids.0
  instance_name            = var.name
  security_ips             = ["10.168.1.12", "100.69.7.112"]
}

resource "alicloud_db_readonly_instance" "default" {
  auto_renew               = var.auto_renew_var
  instance_type            = var.instance_type_var
  effective_time           = var.effective_time_var
  period                   = var.period_var
  db_instance_storage_type = var.db_instance_storage_type_var
  direction                = var.direction_var
  deletion_protection      = var.deletion_protection_var
  client_crl_enabled       = var.client_crl_enabled_var
  security_ips = [
    "10.168.1.12",
    "100.69.7.112"
  ]
  client_cert_revocation_list = var.client_cert_revocation_list_var
  client_ca_cert              = var.client_ca_cert_var
  zone_id                     = alicloud_db_instance.default.zone_id
  instance_charge_type        = var.instance_charge_type_var
  tags = {
    Created = "TF"
    For     = "acceptance Test"
  }
  client_ca_enabled              = var.client_ca_enabled_var
  replication_acl                = var.replication_acl_var
  db_instance_ip_array_attribute = var.db_instance_ip_array_attribute_var
  engine_version                 = alicloud_db_instance.default.engine_version
  ca_type                        = var.ca_type_var
  resource_group_id              = data.alicloud_resource_manager_resource_groups.default.ids.0
  instance_storage               = alicloud_db_instance.default.instance_storage
  acl                            = var.acl_var
  instance_name                  = var.name
  ssl_enabled                    = var.ssl_enabled_var
  master_db_instance_id          = alicloud_db_instance.default.id
  whitelist_network_type         = var.whitelist_network_type_var
  db_instance_ip_array_name      = var.db_instance_ip_array_name_var
  auto_renew_period              = var.auto_renew_period_var
  vswitch_id                     = data.alicloud_vswitches.default.ids.0
}
