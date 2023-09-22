resource "alicloud_dfs_access_group" "default" {
  network_type      = "VPC"
  access_group_name = var.name
  description       = var.name
}

resource "alicloud_dfs_access_rule" "default" {
  network_segment = "192.0.2.0/24"
  rw_access_type  = var.rw_access_type_var
  priority        = var.priority_var
  access_group_id = alicloud_dfs_access_group.default.id
}
