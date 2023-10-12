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

resource "alicloud_vswitch" "this" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_db_zones.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 8, 4)
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.this.*.id, [""])[0]
}

resource "alicloud_db_instance" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  db_instance_storage_type = "cloud_essd"
  instance_type            = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage         = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  vswitch_id               = local.vswitch_id
  instance_name            = var.name
}

resource "alicloud_db_readonly_instance" "default" {
  master_db_instance_id = alicloud_db_instance.default.id
  zone_id               = alicloud_db_instance.default.zone_id
  engine_version        = alicloud_db_instance.default.engine_version
  instance_type         = "mysqlro.n4.medium.1c"
  instance_storage      = alicloud_db_instance.default.instance_storage
  instance_name         = "${var.name}_ro"
  vswitch_id            = alicloud_db_instance.default.vswitch_id
}

resource "alicloud_rds_db_proxy" "default" {
  vpc_id = alicloud_db_instance.default.vpc_id
  read_only_instance_weight {
    instance_id = alicloud_db_instance.default.id
    weight      = "100"
  }
  read_only_instance_weight {
    instance_id = alicloud_db_readonly_instance.default.id
    weight      = "500"
  }

  db_proxy_ssl_enabled = var.db_proxy_ssl_enabled_var
  depends_on = [
    alicloud_db_readonly_instance.default
  ]
  db_proxy_connect_string_port         = var.db_proxy_connect_string_port_var
  read_only_instance_max_delay_time    = var.read_only_instance_max_delay_time_var
  vswitch_id                           = alicloud_db_instance.default.vswitch_id
  db_proxy_features                    = var.db_proxy_features_var
  instance_id                          = alicloud_db_instance.default.id
  effective_time                       = var.effective_time_var
  read_only_instance_distribution_type = var.read_only_instance_distribution_type_var
  db_proxy_connection_prefix           = var.db_proxy_connection_prefix_var
  upgrade_time                         = var.upgrade_time_var
  instance_network_type                = "VPC"
  db_proxy_instance_num                = var.db_proxy_instance_num_var
  db_proxy_endpoint_read_write_mode    = var.db_proxy_endpoint_read_write_mode_var
}
