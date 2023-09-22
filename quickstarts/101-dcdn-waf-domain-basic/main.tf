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
  domain_name = alicloud_dcdn_domain.default.domain_name
}
