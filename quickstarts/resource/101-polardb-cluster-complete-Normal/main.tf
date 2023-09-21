data "alicloud_polardb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  zone_id = local.zone_id
  vpc_id  = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_vswitch" "this" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = "tf_examplePolarDB"
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_polardb_zones.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 8, 4)
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.this.*.id, [""])[0]
  zone_id    = data.alicloud_polardb_zones.default.ids[length(data.alicloud_polardb_zones.default.ids) - 1]
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

data "alicloud_polardb_parameter_groups" "default" {
  db_type    = "MySQL"
  db_version = "8.0"
}

resource "alicloud_polardb_cluster" "cluster" {
  db_type       = "MySQL"
  db_version    = "8.0"
  pay_type      = "PostPaid"
  db_node_count = "2"
  db_node_class = "polar.mysql.x4.large"
  vswitch_id    = "${local.vswitch_id}"
  description   = "${var.name}"
}

resource "alicloud_polardb_global_database_network" "default" {
  db_cluster_id = "${alicloud_polardb_cluster.cluster.id}"
  description   = var.name
}

resource "alicloud_polardb_cluster" "default" {
  db_version               = "8.0"
  clone_data_point         = var.clone_data_point_var
  seconds_until_auto_pause = var.seconds_until_auto_pause_var
  source_resource_id       = alicloud_polardb_cluster.cluster.id
  auto_renew_period        = var.auto_renew_period_var
  creation_category        = "Normal"
  scale_min                = var.scale_min_var
  description              = var.name
  period                   = var.period_var
  scale_max                = var.scale_max_var
  scale_ro_num_min         = var.scale_ro_num_min_var
  pay_type                 = var.pay_type_var
  resource_group_id        = data.alicloud_resource_manager_resource_groups.default.ids.0
  parameters {
    name  = "wait_timeout"
    value = "86"
  }
  parameters {
    name  = "innodb_old_blocks_time"
    value = "10"
  }

  renewal_status                              = var.renewal_status_var
  db_node_num                                 = var.db_node_num_var
  db_type                                     = "MySQL"
  backup_retention_policy_on_cluster_deletion = var.backup_retention_policy_on_cluster_deletion_var
  loose_polar_log_bin                         = var.loose_polar_log_bin_var
  parameter_group_id                          = data.alicloud_polardb_parameter_groups.default.groups.0.id
  serverless_type                             = "AgileServerless"
  lower_case_table_names                      = var.lower_case_table_names_var
  db_node_count                               = var.db_node_count_var
  db_node_class                               = data.alicloud_polardb_node_classes.this.classes.0.supported_engines.0.available_resources.0.db_node_class
  gdn_id                                      = alicloud_polardb_global_database_network.default.id
  allow_shut_down                             = var.allow_shut_down_var
  default_time_zone                           = var.default_time_zone_var
  zone_id                                     = data.alicloud_polardb_node_classes.this.classes.0.zone_id
  creation_option                             = var.creation_option_var
  scale_ro_num_max                            = var.scale_ro_num_max_var
  vswitch_id                                  = local.vswitch_id
}
