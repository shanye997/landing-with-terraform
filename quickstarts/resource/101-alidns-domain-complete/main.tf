resource "alicloud_dns_group" "default" {
  name = "${var.dnsGroupName}"
}

resource "alicloud_alidns_domain" "default" {
  resource_group_id = ""
  tags = {
    Created = "TF"
  }
  domain_name = var.dnsName
  group_id    = alicloud_dns_group.default.id
  remark      = var.remark_var
}
