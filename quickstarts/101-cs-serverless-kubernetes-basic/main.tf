resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_cs_serverless_kubernetes" "default" {
  vpc_id = alicloud_vpc.default.id
}
