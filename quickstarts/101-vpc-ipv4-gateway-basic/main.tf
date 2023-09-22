resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}2"
  cidr_block = "10.0.0.0/8"
}

resource "alicloud_vpc_ipv4_gateway" "default" {
  vpc_id = alicloud_vpc.default.id
}
