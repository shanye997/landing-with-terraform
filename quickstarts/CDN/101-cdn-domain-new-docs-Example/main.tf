variable "domain_name" {
  default = "mycdndomain.alicloud-provider.cn"
}

resource "alicloud_cdn_domain_new" "default" {
  scope       = "overseas"
  domain_name = var.domain_name
  cdn_type    = "web"
  sources {
    type     = "ipaddr"
    content  = "1.1.1.1"
    priority = 20
    port     = 80
    weight   = 15
  }
}