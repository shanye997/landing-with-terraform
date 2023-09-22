resource "alicloud_cdn_domain_new" "default" {
  sources {
    content  = "1.1.1.1"
    port     = "80"
    priority = "20"
    type     = "ipaddr"
    weight   = "15"
  }

  domain_name = "wkk.pfytlm.xyz"
  cdn_type    = "web"
}
