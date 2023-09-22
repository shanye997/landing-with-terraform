data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_vpn_gateway" "default" {
  vswitch_id = data.alicloud_vswitches.default.vswitches.0.id
  tags = {
    For     = "TestF"
    From    = ""
    Created = "TF"
  }
  network_type         = "private"
  period               = var.period_var
  enable_ssl           = "true"
  name                 = var.name_var
  auto_propagate       = var.auto_propagate_var
  bandwidth            = "10"
  vpc_id               = data.alicloud_vpcs.default.ids.0
  instance_charge_type = "PrePaid"
  description          = var.description_var
}
