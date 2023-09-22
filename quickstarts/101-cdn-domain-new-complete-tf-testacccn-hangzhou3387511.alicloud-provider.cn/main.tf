resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-cdn-3387511"
}

resource "alicloud_cdn_domain_new" "domain" {
  scope = "overseas"
  sources {
    priority = "20"
    type     = "oss"
    weight   = "30"
    content  = "${alicloud_oss_bucket.default.bucket}.${alicloud_oss_bucket.default.extranet_endpoint}"
    port     = "80"
  }

  cdn_type    = "web"
  domain_name = "tf-examplecn-hangzhou3387511.alicloud-provider.cn"
}
