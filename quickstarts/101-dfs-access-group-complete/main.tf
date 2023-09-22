resource "alicloud_dfs_access_group" "default" {
  description       = "${var.name}_Desc"
  network_type      = "VPC"
  access_group_name = var.name
}
