resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "10.1.0.0/21"
}

resource "alicloud_express_connect_router_interface" "default" {
  payment_type          = "PayAsYouGo"
  description           = var.description_var
  role                  = "InitiatingSide"
  router_id             = alicloud_vpc.default.router_id
  spec                  = var.spec_var
  opposite_router_type  = var.opposite_router_type_var
  router_type           = "VRouter"
  router_interface_name = var.router_interface_name_var
  opposite_region_id    = "cn-hangzhou"
}
