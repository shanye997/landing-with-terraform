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
}

resource "alicloud_rds_db_node" "default" {
  db_instance_id = alicloud_db_instance.default.id
  class_code     = alicloud_db_instance.default.instance_type
  zone_id        = alicloud_db_instance.default.zone_id
}

resource "alicloud_rds_db_instance_endpoint" "default" {
  db_instance_id                   = alicloud_db_instance.default.id
  vpc_id                           = alicloud_db_instance.default.vpc_id
  vswitch_id                       = alicloud_db_instance.default.vswitch_id
  connection_string_prefix         = "${var.name}private"
  port                             = "3306"
  db_instance_endpoint_description = "test"
  node_items {
    node_id = alicloud_rds_db_node.default.node_id
    weight  = 10
  }
}

resource "alicloud_rds_db_instance_endpoint_address" "default" {
  connection_string_prefix = "${var.name}zcc"
  db_instance_endpoint_id  = alicloud_rds_db_instance_endpoint.default.db_instance_endpoint_id
  db_instance_id           = alicloud_rds_db_node.default.db_instance_id
  port                     = var.port_var
}
