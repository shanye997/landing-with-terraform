resource "alicloud_dcdn_domain" "default" {
  domain_name = var.domain_name
  sources {
    content  = "1.1.1.1"
    port     = "80"
    priority = "20"
    type     = "ipaddr"
  }
}

resource "alicloud_dcdn_waf_domain" "default" {
  domain_name   = alicloud_dcdn_domain.default.domain_name
  client_ip_tag = "X-Forwarded-For"
}

resource "alicloud_dcdn_waf_policy" "default" {
  policy_type   = "custom"
  policy_name   = var.name
  defense_scene = "waf_group"
  status        = "on"
}

resource "alicloud_dcdn_waf_policy_domain_attachment" "default" {
  policy_id   = alicloud_dcdn_waf_policy.default.id
  domain_name = alicloud_dcdn_waf_domain.default.domain_name
}
