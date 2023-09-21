data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_spec = "slb.s2.small"
  vswitch_id         = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_ga_basic_accelerator" "default" {
  duration               = 1
  pricing_cycle          = "Month"
  basic_accelerator_name = var.name
  description            = var.name
  bandwidth_billing_type = "CDT"
  auto_pay               = true
  auto_use_coupon        = "true"
  auto_renew             = false
  auto_renew_duration    = 1
}

resource "alicloud_ga_basic_endpoint_group" "default" {
  endpoint_group_region     = "cn-beijing"
  endpoint_sub_address      = "192.168.0.1"
  endpoint_type             = "SLB"
  accelerator_id            = alicloud_ga_basic_accelerator.default.id
  basic_endpoint_group_name = var.basic_endpoint_group_name_var
  description               = var.description_var
  endpoint_address          = alicloud_slb_load_balancer.default.id
}
