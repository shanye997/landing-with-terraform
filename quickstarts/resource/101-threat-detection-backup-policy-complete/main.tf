data "alicloud_threat_detection_assets" "default" {
  machine_types = "ecs"
}

resource "alicloud_threat_detection_backup_policy" "default" {
  backup_policy_name = var.backup_policy_name_var
  policy             = var.policy_var
  policy_version     = "2.0.0"
  uuid_list = [
    data.alicloud_threat_detection_assets.default.ids.0
  ]
}
