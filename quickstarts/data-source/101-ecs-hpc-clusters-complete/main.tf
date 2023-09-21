resource "alicloud_ecs_hpc_cluster" "default" {
  name        = "tf-exampleEcsHpcClustersTest14620"
  description = "For Terraform Test"
}

data "alicloud_ecs_hpc_clusters" "default" {
  name_regex = "tf-exampleEcsHpcClustersTest14620"
  ids = [
    "${alicloud_ecs_hpc_cluster.default.id}-fake"
  ]
}
