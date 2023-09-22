resource "alicloud_vpc" "defaultVpc" {
  vpc_name = var.name
}

resource "alicloud_route_table" "default" {
  vpc_id = alicloud_vpc.defaultVpc.id
}
