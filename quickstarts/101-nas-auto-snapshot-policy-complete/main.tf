resource "alicloud_nas_auto_snapshot_policy" "default" {
  retention_days = var.retention_days_var
  time_points = [
    "1",
    "2"
  ]
  auto_snapshot_policy_name = var.name
  repeat_weekdays = [
    "3",
    "4"
  ]
}
