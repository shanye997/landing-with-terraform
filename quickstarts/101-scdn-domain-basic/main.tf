resource "alicloud_scdn_domain" "default" {
  sources {
    content  = "xiaozhu.aliyuncs.com"
    port     = "80"
    priority = "20"
    type     = "oss"
  }
  sources {
    enabled  = "offline"
    port     = "90"
    priority = "21"
    type     = "domain"
    content  = "xiaozhu.aliyuncs.com"
  }

  domain_name = "tf-examplecn-hangzhou3043473.alicloud-provider.cn"
}
