resource "alicloud_vod_domain" "default" {
  scope = "domestic"
  sources {
    source_port    = "443"
    source_type    = "domain"
    source_content = "outin-c7405446108111ec9a7100163e0eb78b.oss-cn-beijing.aliyuncs.com"
  }

  tags = {
    Tfexample123 = "Tftest123"
    tfexample    = "TFTEST"
  }
  domain_name = "136.chat"
}
