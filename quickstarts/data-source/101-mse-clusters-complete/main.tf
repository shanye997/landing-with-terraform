data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_mse_cluster" "default" {
  cluster_specification = "MSE_SC_1_2_60_c"
  cluster_type          = "Nacos-Ans"
  cluster_version       = "NACOS_2_0_0"
  instance_count        = 1
  net_type              = "privatenet"
  vswitch_id            = data.alicloud_vswitches.default.ids.0
  pub_network_flow      = "1"
  acl_entry_list        = ["127.0.0.1/32"]
  cluster_alias_name    = "tf-exampleMseCluster-4672519"
  mse_version           = "mse_dev"
}

data "alicloud_mse_clusters" "default" {
  ids = [
    "${alicloud_mse_cluster.default.id}-fake"
  ]
  name_regex     = alicloud_mse_cluster.default.cluster_alias_name
  status         = "INIT_SUCCESS"
  enable_details = var.enable_details_var
}
