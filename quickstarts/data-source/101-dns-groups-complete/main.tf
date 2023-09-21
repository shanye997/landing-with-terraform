resource "alicloud_dns_group" "default" {
  name = "tf-example-45492"
}

data "alicloud_dns_groups" "default" {
  name_regex = "${alicloud_dns_group.default.name}_fake"
  ids = [
    alicloud_dns_group.default.id
  ]
}
