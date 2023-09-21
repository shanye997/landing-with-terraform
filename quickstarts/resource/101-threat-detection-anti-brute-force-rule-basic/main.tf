data "alicloud_threat_detection_assets" "default" {
  machine_types = "ecs"
  ids           = ["79d76eac-055a-492a-a5c8-eef3bac80c15"]
}

resource "alicloud_threat_detection_anti_brute_force_rule" "default" {
  anti_brute_force_rule_name = "${var.name}"
  fail_count                 = var.fail_count_var
  forbidden_time             = var.forbidden_time_var
  uuid_list = [
    data.alicloud_threat_detection_assets.default.assets.0.uuid
  ]
  span = var.span_var
}
