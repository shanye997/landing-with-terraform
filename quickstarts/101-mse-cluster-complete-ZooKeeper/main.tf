data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_mse_cluster" "default" {
  net_type              = "privatenet"
  cluster_version       = "ZooKeeper_3_8_0"
  pub_network_flow      = "1"
  cluster_alias_name    = var.cluster_alias_name_var
  cluster_type          = "ZooKeeper"
  instance_count        = var.instance_count_var
  vswitch_id            = data.alicloud_vswitches.default.ids.0
  cluster_specification = var.cluster_specification_var
  acl_entry_list = [
    "127.0.0.0/10"
  ]
  connection_type = "slb"
  mse_version     = "mse_dev"
}
