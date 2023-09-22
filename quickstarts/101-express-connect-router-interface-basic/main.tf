resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "10.1.0.0/21"
}

resource "alicloud_express_connect_router_interface" "default" {
  opposite_region_id = "cn-hangzhou"
  role               = "InitiatingSide"
  spec               = var.spec_var
  router_id          = alicloud_vpc.default.router_id
  router_type        = "VRouter"
}
