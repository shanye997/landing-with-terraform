resource "alicloud_dcdn_waf_policy" "default" {
  defense_scene = "region_block"
  policy_name   = var.name
  policy_type   = "custom"
  status        = "on"
}

resource "alicloud_dcdn_waf_rule" "default" {
  policy_id = alicloud_dcdn_waf_policy.default.id
  rule_name = var.name
  conditions {
    key      = "Http-Method"
    op_value = "match-one"
    values   = "GET,POST,DELETE"
  }

}
