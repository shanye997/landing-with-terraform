data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_nat_gateway" "default" {
  description          = var.description_var
  payment_type         = "Subscription"
  vswitch_id           = data.alicloud_vswitches.default.vswitches.0.id
  vpc_id               = data.alicloud_vpcs.default.ids.0
  name                 = var.name_var
  specification        = var.specification_var
  network_type         = var.network_type_var
  internet_charge_type = "PayBySpec"
  period               = var.period_var
  nat_type             = var.nat_type_var
}
