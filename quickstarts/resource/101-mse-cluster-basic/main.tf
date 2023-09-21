resource "alicloud_mse_cluster" "default" {
  cluster_version       = "NACOS_2_0_0"
  cluster_specification = var.cluster_specification_var
  instance_count        = var.instance_count_var
  net_type              = "privatenet"
  pub_network_flow      = "1"
  cluster_type          = "Nacos-Ans"
}
