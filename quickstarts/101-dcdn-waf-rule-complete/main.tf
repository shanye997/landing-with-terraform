resource "alicloud_dcdn_waf_policy" "default" {
  defense_scene = "region_block"
  policy_name   = var.name
  policy_type   = "custom"
  status        = "on"
}

resource "alicloud_dcdn_waf_rule" "default" {
  regular_rules = [
    "100003",
    "100004"
  ]
  regular_types = [
    "sqli",
    "xss",
    "code_exec"
  ]
  rule_name = var.name
  conditions {
    key      = "Http-Method"
    op_value = "match-one"
    values   = "GET,POST,DELETE"
  }

  effect            = var.effect_var
  cc_status         = var.cc_status_var
  other_region_list = var.other_region_list_var
  policy_id         = alicloud_dcdn_waf_policy.default.id
  remote_addr = [
    "1.1.1.1"
  ]
  status         = var.status_var
  waf_group_ids  = var.waf_group_ids_var
  action         = var.action_var
  cn_region_list = var.cn_region_list_var
  rate_limit {
    interval = "10"
    status {
      ratio = "40"
      code  = "500"
    }

    target    = "Session"
    threshold = "10"
    ttl       = "1200"
  }

  scenes = [
    "waf_group",
    "custom_acl",
    "ip_blacklist",
    "region_block",
    "bot",
    "anti_scan"
  ]
}
