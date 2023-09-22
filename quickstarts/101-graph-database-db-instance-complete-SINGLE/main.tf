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
  vpc_id                   = data.alicloud_vpcs.default.ids.0
  db_instance_category     = "SINGLE"
  db_instance_storage_type = "cloud_essd"
  payment_type             = "PayAsYouGo"
  db_node_storage          = var.db_node_storage_var
  db_version               = "1.0"
  vswitch_id               = data.alicloud_vswitches.default.ids.0
  zone_id                  = local.zone_id
  db_instance_description  = var.name
  db_instance_network_type = "vpc"
  db_node_class            = var.db_node_class_var
}
