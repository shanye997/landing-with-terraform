resource "alicloud_ecs_auto_snapshot_policy" "default" {
  retention_days = var.retention_days_var
  tags = {
    Created = "TF"
    For     = "Test"
  }
  target_copy_regions = [
    "cn-beijing"
  ]
  time_points = [
    "1"
  ]
  copied_snapshots_retention_days = var.copied_snapshots_retention_days_var
  enable_cross_region_copy        = var.enable_cross_region_copy_var
  name                            = var.name_var
  repeat_weekdays = [
    "1"
  ]
}
