resource "alicloud_ecs_auto_snapshot_policy" "default" {
  name            = "tf-exampleEcsAutoSnapshotPoliciesTest13500"
  repeat_weekdays = ["1"]
  retention_days  = -1
  time_points     = ["1"]
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

data "alicloud_ecs_auto_snapshot_policies" "default" {
  status = "Normal"
  tags = {
    For     = "acceptance test"
    Created = "TF"
  }
  ids = [
    alicloud_ecs_auto_snapshot_policy.default.id
  ]
  name_regex = "tf-exampleEcsAutoSnapshotPoliciesTest13500fake"
}
