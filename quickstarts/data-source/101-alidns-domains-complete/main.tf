resource "alicloud_dns_group" "default" {
  name = "${var.dnsGroupName}"
}

resource "alicloud_dns_domain" "default" {
  domain_name       = "${var.dnsName}"
  group_id          = "${alicloud_dns_group.default.id}"
  resource_group_id = ""
}

data "alicloud_alidns_domains" "default" {
  version_code      = "mianfei"
  ali_domain        = "true"
  domain_name_regex = alicloud_dns_domain.default.domain_name
  group_name_regex  = alicloud_dns_group.default.name
  ids = [
    alicloud_dns_domain.default.id
  ]
  instance_id       = ""
  resource_group_id = ""
}
