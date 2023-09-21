resource "alicloud_dns" "default" {
  name = "tf-examplecn-hangzhoudns7511874692408996316.abc"
}

resource "alicloud_dns_record" "default" {
  name        = "${alicloud_dns.default.name}"
  host_record = "alimail"
  type        = "CNAME"
  value       = "mail.mxhichin.com"
}

data "alicloud_dns_records" "default" {
  domain_name = alicloud_dns_record.default.name
}
