resource "alicloud_cdn_domain_new" "default" {
  domain_name = "tf-examplecn-hangzhou1362430-oss.alicloud-provider.cn"
  cdn_type    = "web"
  scope       = "overseas"
  sources {
    content  = "${alicloud_oss_bucket.default.bucket}.${alicloud_oss_bucket.default.extranet_endpoint}"
    type     = "oss"
    priority = 20
    port     = 80
    weight   = 10
  }
}

resource "alicloud_oss_bucket" "default" {
  bucket = "tf-example-domain-config-cn-hangzhou1362430"
}

resource "alicloud_cdn_domain_config" "default" {
  function_name = var.function_name_var
  domain_name   = alicloud_cdn_domain_new.default.domain_name
  function_args {
    arg_name  = "oss_bucket_id"
    arg_value = alicloud_oss_bucket.default.id
  }

}
