data "alicloud_mongodb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = "${data.alicloud_mongodb_zones.default.zones.0.id}"
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
  cluster_alias_name    = "tf-examplemseznode"
  mse_version           = "mse_dev"
}

resource "alicloud_mse_znode" "default" {
  path       = var.name
  cluster_id = alicloud_mse_cluster.default.cluster_id
}
