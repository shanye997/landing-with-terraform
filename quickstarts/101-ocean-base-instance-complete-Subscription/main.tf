data "alicloud_zones" "default" {}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_ocean_base_instance" "default" {
  auto_renew_period  = var.auto_renew_period_var
  disk_size          = var.disk_size_var
  resource_group_id  = data.alicloud_resource_manager_resource_groups.default.ids.0
  backup_retain_mode = var.backup_retain_mode_var
  instance_name      = var.name
  period             = var.period_var
  series             = "normal"
  zones = [
    data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 2],
    data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 3],
    data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 4]
  ]
  auto_renew     = var.auto_renew_var
  instance_class = var.instance_class_var
  ob_version     = "4.1.0.2"
  payment_type   = "Subscription"
  period_unit    = var.period_unit_var
  disk_type      = "cloud_essd_pl1"
}
