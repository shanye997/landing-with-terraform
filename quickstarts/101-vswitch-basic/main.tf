resource "alicloud_vpc" "OeB4be" {
  vpc_name    = var.name
  enable_ipv6 = true
  cidr_block  = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  cidr_block = "172.16.0.0/24"
  vpc_id     = alicloud_vpc.OeB4be.id
}
