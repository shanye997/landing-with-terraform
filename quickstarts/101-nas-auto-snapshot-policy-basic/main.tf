resource "alicloud_nas_auto_snapshot_policy" "default" {
  repeat_weekdays = [
    "3",
    "4"
  ]
  time_points = [
    "1",
    "2"
  ]
}
