data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  zone_id = data.alicloud_polardb_node_classes.this.classes.0.zone_id
  vpc_id  = data.alicloud_vpcs.default.ids.0
}

data "alicloud_polardb_node_classes" "this" {
  db_type    = "MySQL"
  db_version = "8.0"
  pay_type   = "PostPaid"
  category   = "Normal"
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_polardb_cluster" "default" {
  proxy_type          = var.proxy_type_var
  creation_category   = "SENormal"
  proxy_class         = var.proxy_class_var
  description         = var.name
  vswitch_id          = data.alicloud_vswitches.default.vswitches.0.id
  storage_space       = var.storage_space_var
  storage_type        = "ESSDPL1"
  db_node_num         = var.db_node_num_var
  db_version          = "8.0"
  db_type             = "MySQL"
  hot_standby_cluster = var.hot_standby_cluster_var
  pay_type            = var.pay_type_var
  storage_pay_type    = "PostPaid"
  db_node_class       = var.db_node_class_var
  resource_group_id   = data.alicloud_resource_manager_resource_groups.default.ids.0
}
