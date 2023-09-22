data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_mse_cluster" "default" {
  cluster_specification = "MSE_SC_1_2_60_c"
  cluster_type          = "ZooKeeper"
  cluster_version       = "ZooKeeper_3_8_0"
  instance_count        = 1
  net_type              = "privatenet"
  vswitch_id            = data.alicloud_vswitches.default.ids.0
  pub_network_flow      = "1"
  acl_entry_list        = ["127.0.0.1/32"]
  cluster_alias_name    = var.name
  mse_version           = "mse_dev"
}

resource "alicloud_mse_engine_namespace" "default" {
  namespace_id        = var.name
  namespace_show_name = "${var.name}"
  cluster_id          = alicloud_mse_cluster.default.id
}
