resource "alicloud_vod_domain" "default" {
  domain_name = "136.chat"
  sources {
    source_content = "outin-c7405446108111ec9a7100163e0eb78b.oss-cn-beijing.aliyuncs.com"
    source_port    = "443"
    source_type    = "domain"
  }

}
