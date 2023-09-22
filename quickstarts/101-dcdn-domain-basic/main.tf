resource "alicloud_dcdn_domain" "default" {
  sources {
    content  = "1.1.1.1"
    port     = "80"
    priority = "20"
    type     = "ipaddr"
    weight   = "10"
  }
  sources {
    content = "2.2.2.2"
    type    = "ipaddr"
  }

  domain_name = "tf-examplecn-hangzhou3107830.alicloud-provider.cn"
}
