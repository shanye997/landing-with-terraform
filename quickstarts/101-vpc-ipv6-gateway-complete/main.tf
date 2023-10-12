resource "alicloud_vpc" "default" {
  vpc_name    = var.name
  enable_ipv6 = "true"
}

resource "alicloud_resource_manager_resource_group" "defaultRg" {
  display_name        = "tf-example-ipv6gateway258"
  resource_group_name = "${var.name}1"
}

resource "alicloud_vpc_ipv6_gateway" "default" {
  ipv6_gateway_name = var.name
  resource_group_id = alicloud_resource_manager_resource_group.defaultRg.id
  tags = {
    Created = "TF"
    For     = "Test"
  }
  vpc_id      = alicloud_vpc.default.id
  description = var.name
}
