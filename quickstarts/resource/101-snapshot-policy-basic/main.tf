resource "alicloud_snapshot_policy" "default" {
  retention_days = var.retention_days_var
  repeat_weekdays = [
    "1"
  ]
  count = "5"
  time_points = [
    "1"
  ]
}
