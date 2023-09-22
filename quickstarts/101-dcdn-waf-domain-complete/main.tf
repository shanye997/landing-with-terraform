resource "alicloud_dcdn_domain" "default" {
  domain_name = "${var.domain_name}"
  sources {
    content  = "1.1.1.1"
    port     = "80"
    priority = "20"
    type     = "ipaddr"
  }
}

resource "alicloud_dcdn_waf_domain" "default" {
  client_ip_tag = var.client_ip_tag_var
  domain_name   = alicloud_dcdn_domain.default.domain_name
}
