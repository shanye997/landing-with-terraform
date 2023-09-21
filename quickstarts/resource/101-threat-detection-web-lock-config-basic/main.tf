data "alicloud_threat_detection_assets" "default" {
  machine_types = "ecs"
}

resource "alicloud_threat_detection_web_lock_config" "default" {
  defence_mode     = "audit"
  mode             = "whitelist"
  local_backup_dir = "/usr/local/aegis/bak"
  uuid             = data.alicloud_threat_detection_assets.default.ids.0
  dir              = "/tmp/"
}
