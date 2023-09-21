data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "default"
}

data "alicloud_adb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_adb_zones.default.ids.0
}

locals {
  vswitch_id = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_adb_db_cluster" "default" {
  maintain_time = var.maintain_time_var
  security_ips = [
    "10.168.1.13"
  ]
  db_cluster_category = var.db_cluster_category_var
  vpc_id              = data.alicloud_vpcs.default.ids.0
  mode                = var.mode_var
  db_node_class       = var.db_node_class_var
  period              = var.period_var
  db_node_storage     = var.db_node_storage_var
  compute_resource    = var.compute_resource_var
  tags = {
    Created = "TF"
    For     = "test"
  }
  payment_type        = var.payment_type_var
  description         = var.name
  vswitch_id          = local.vswitch_id
  db_node_count       = var.db_node_count_var
  resource_group_id   = data.alicloud_resource_manager_resource_groups.default.ids.0
  elastic_io_resource = var.elastic_io_resource_var
}
