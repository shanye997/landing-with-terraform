resource "alicloud_dcdn_waf_policy" "default" {
  defense_scene = "waf_group"
  policy_name   = "${var.name}"
  policy_type   = "custom"
  status        = var.status_var
}
