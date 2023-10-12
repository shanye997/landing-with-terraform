resource "alicloud_vpc" "default" {
  vpc_name    = var.name
  enable_ipv6 = "true"
}

resource "alicloud_vpc_ipv6_gateway" "default" {
  vpc_id = alicloud_vpc.default.id
}
