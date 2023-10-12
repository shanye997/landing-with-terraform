data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

data "alicloud_polardb_node_classes" "default" {
  zone_id    = data.alicloud_vswitches.default.vswitches.0.zone_id
  pay_type   = "PostPaid"
  db_type    = "MySQL"
  db_version = "8.0"
  category   = "Normal"
}

resource "alicloud_polardb_cluster" "default" {
  db_type       = "MySQL"
  db_version    = "8.0"
  pay_type      = "PostPaid"
  db_node_class = data.alicloud_polardb_node_classes.default.classes.0.supported_engines.0.available_resources.2.db_node_class
  vswitch_id    = data.alicloud_vswitches.default.ids.0
  description   = "${var.name}"
}

resource "alicloud_polardb_global_database_network" "default" {
  description   = var.description_var
  db_cluster_id = alicloud_polardb_cluster.default.id
}
