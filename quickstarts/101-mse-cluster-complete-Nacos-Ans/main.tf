data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_mse_cluster" "default" {
  pub_network_flow      = "1"
  connection_type       = "slb"
  net_type              = "privatenet"
  cluster_type          = "Nacos-Ans"
  vpc_id                = data.alicloud_vpcs.default.ids.0
  cluster_specification = var.cluster_specification_var
  cluster_version       = "NACOS_2_0_0"
  mse_version           = "mse_dev"
  acl_entry_list = [
    "127.0.0.0/10"
  ]
  instance_count     = var.instance_count_var
  vswitch_id         = data.alicloud_vswitches.default.ids.0
  cluster_alias_name = var.cluster_alias_name_var
}
