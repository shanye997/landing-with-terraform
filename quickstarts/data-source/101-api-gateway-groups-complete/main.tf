resource "alicloud_api_gateway_group" "default" {
  name        = "${var.name}"
  description = "${var.description}"
}

data "alicloud_api_gateway_groups" "default" {
  ids = [
    alicloud_api_gateway_group.default.id
  ]
  name_regex = "${alicloud_api_gateway_group.default.name}_fake"
}
