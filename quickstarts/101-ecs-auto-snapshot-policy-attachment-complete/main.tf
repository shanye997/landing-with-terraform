resource "alicloud_ecs_auto_snapshot_policy" "default" {
  name            = "var.name"
  repeat_weekdays = ["1"]
  retention_days  = -1
  time_points     = ["1"]
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

data "alicloud_zones" default {
  available_resource_creation = "Instance"
}

resource "alicloud_ecs_disk" "default" {
  zone_id              = "${data.alicloud_zones.default.zones.0.id}"
  category             = "cloud_efficiency"
  delete_auto_snapshot = "true"
  description          = "Test For Terraform"
  disk_name            = var.name
  enable_auto_snapshot = "true"
  encrypted            = "true"
  size                 = "500"
  tags = {
    Created     = "TF"
    Environment = "Acceptance-test"
  }
}

resource "alicloud_ecs_auto_snapshot_policy_attachment" "default" {
  auto_snapshot_policy_id = alicloud_ecs_auto_snapshot_policy.default.id
  disk_id                 = alicloud_ecs_disk.default.id
}
