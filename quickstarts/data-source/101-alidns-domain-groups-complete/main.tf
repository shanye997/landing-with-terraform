resource "alicloud_alidns_domain_group" "default" {
  group_name = "tf-exampleadnsDG736"
}

data "alicloud_alidns_domain_groups" "default" {
  name_regex = "${alicloud_alidns_domain_group.default.group_name}-fake"
  ids = [
    alicloud_alidns_domain_group.default.id
  ]
}
