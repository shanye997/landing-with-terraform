resource "alicloud_dns_group" "default" {
  name = "${var.dnsGroupName}"
}

resource "alicloud_dns" "default" {
  name              = var.dnsName
  resource_group_id = ""
  group_id          = alicloud_dns_group.default.id
}
