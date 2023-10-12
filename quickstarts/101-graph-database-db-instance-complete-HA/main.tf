locals {
  zone_id = "cn-hangzhou-h"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = local.zone_id
}

resource "alicloud_graph_database_db_instance" "default" {
  db_instance_ip_array {
    db_instance_ip_array_name = "default"
    security_ips              = "127.0.0.1"
  }

  db_node_class            = var.db_node_class_var
  vswitch_id               = data.alicloud_vswitches.default.ids.0
  zone_id                  = local.zone_id
  db_instance_network_type = "vpc"
  payment_type             = "PayAsYouGo"
  db_version               = "1.0"
  db_instance_description  = var.name
  db_node_storage          = var.db_node_storage_var
  db_instance_category     = "HA"
  vpc_id                   = data.alicloud_vpcs.default.ids.0
  db_instance_storage_type = "cloud_essd"
}
