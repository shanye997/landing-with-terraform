data "alicloud_polardb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  zone_id = data.alicloud_polardb_zones.default.ids[length(data.alicloud_polardb_zones.default.ids) - 1]
  vpc_id  = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_polardb_cluster" "cluster" {
  db_type       = "MySQL"
  db_version    = "8.0"
  pay_type      = "PostPaid"
  db_node_class = "polar.mysql.x4.medium"
  vswitch_id    = data.alicloud_vswitches.default.ids.0
  description   = "${var.name}"
}

resource "alicloud_polardb_endpoint" "default" {
  auto_add_new_nodes      = var.auto_add_new_nodes_var
  db_cluster_id           = alicloud_polardb_cluster.cluster.id
  db_endpoint_description = var.db_endpoint_description_var
  endpoint_config = {

  }
  net_type        = var.net_type_var
  read_write_mode = var.read_write_mode_var
  ssl_auto_rotate = var.ssl_auto_rotate_var
  ssl_enabled     = var.ssl_enabled_var
}
