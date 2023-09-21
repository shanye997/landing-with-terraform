resource "alicloud_dns_domain" "default" {
  domain_name = "tf-examplecn-hangzhoualidns9056382414984104436.abc"
}

resource "alicloud_alidns_record" "default" {
  domain_name = "${alicloud_dns_domain.default.domain_name}"
  rr          = "alimail"
  type        = "CNAME"
  remark      = "tf-example"
  value       = "mail.mxhichin.com"
}

data "alicloud_alidns_records" "default" {
  domain_name = alicloud_alidns_record.default.domain_name
}
