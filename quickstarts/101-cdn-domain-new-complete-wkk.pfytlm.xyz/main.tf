resource "alicloud_cdn_domain_new" "default" {
  tags = {
    Created = "TF"
    For     = "Test"
  }
  cdn_type    = "web"
  domain_name = "wkk.pfytlm.xyz"
  scope       = "domestic"
  sources {
    content  = "1.1.1.1"
    port     = "80"
    priority = "20"
    type     = "ipaddr"
    weight   = "15"
  }

}
