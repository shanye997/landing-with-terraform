resource "alicloud_dns" "default" {
  name = "tf-examplecn-hangzhoudns4207.abc"
}

resource "alicloud_dns_record" "default" {
  name        = "${alicloud_dns.default.name}"
  host_record = "alimail"
  routing     = "unicom"
  type        = "CNAME"
  value       = "mail.mxhichin.com"
}

data "alicloud_dns_resolution_lines" "default" {
  line_display_names = [
    "中国联通"
  ]
  line_names = [
    "中国联通_fake"
  ]
  user_client_ip = "205.204.117.106"
  domain_name    = alicloud_dns_record.default.name
  lang           = "zh"
  line_codes = [
    alicloud_dns_record.default.routing
  ]
}
