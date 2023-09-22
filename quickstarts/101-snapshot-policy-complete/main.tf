resource "alicloud_snapshot_policy" "default" {
  count = "5"
  name  = var.name_var
  repeat_weekdays = [
    "1"
  ]
  retention_days = var.retention_days_var
  time_points = [
    "1"
  ]
}
