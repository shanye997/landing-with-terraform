resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "10.1.0.0/21"
}

resource "alicloud_express_connect_router_interface" "default" {
  router_id             = alicloud_vpc.default.router_id
  router_interface_name = var.router_interface_name_var
  router_type           = "VRouter"
  period                = var.period_var
  pricing_cycle         = var.pricing_cycle_var
  payment_type          = "Subscription"
  role                  = "InitiatingSide"
  spec                  = var.spec_var
  description           = var.description_var
  opposite_region_id    = "cn-hangzhou"
}
