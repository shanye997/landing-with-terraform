resource "alicloud_ecs_auto_snapshot_policy" "default" {
  time_points = [
    "1"
  ]
  repeat_weekdays = [
    "1"
  ]
  retention_days = var.retention_days_var
}
