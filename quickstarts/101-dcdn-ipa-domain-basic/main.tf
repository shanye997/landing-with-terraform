resource "alicloud_dcdn_ipa_domain" "default" {
  sources {
    weight   = "10"
    content  = "www.alicloud-provider.cn"
    port     = "8898"
    priority = "20"
    type     = "domain"
  }

  domain_name = var.domain_name
}
