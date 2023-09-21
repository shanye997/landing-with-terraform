data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

resource "alicloud_route_table" "default" {
  vpc_id           = "${data.alicloud_vpcs.default.ids.0}"
  route_table_name = "${var.name}"
  description      = "${var.name}_description"
  associate_type   = "Gateway"
}

resource "alicloud_vpc_ipv4_gateway" "default" {
  ipv4_gateway_description = var.name
  ipv4_gateway_name        = var.name
  vpc_id                   = "${data.alicloud_vpcs.default.ids.0}"
  enabled                  = "true"
}

resource "alicloud_vpc_gateway_route_table_attachment" "default" {
  ipv4_gateway_id = alicloud_vpc_ipv4_gateway.default.id
  route_table_id  = alicloud_route_table.default.id
}
