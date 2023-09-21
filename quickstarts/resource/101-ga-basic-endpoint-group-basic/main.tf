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
  endpoint_group_region = "cn-beijing"
  accelerator_id        = alicloud_ga_basic_accelerator.default.id
}
