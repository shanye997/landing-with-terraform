resource "alicloud_dbfs_auto_snap_shot_policy" "default" {
  time_points = [
    "05"
  ]
  policy_name = "${var.name}"
  repeat_weekdays = [
    "1"
  ]
  retention_days = var.retention_days_var
}
