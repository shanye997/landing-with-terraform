data "alicloud_zones" "default" {}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_ocean_base_instance" "default" {
  instance_class = var.instance_class_var
  series         = "normal"
  zones = [
    data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 2],
    data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 3],
    data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 4]
  ]
  instance_name      = var.name
  auto_renew         = var.auto_renew_var
  resource_group_id  = data.alicloud_resource_manager_resource_groups.default.ids.0
  disk_size          = var.disk_size_var
  backup_retain_mode = var.backup_retain_mode_var
  payment_type       = "PayAsYouGo"
  node_num           = var.node_num_var
}
