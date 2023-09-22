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

resource "alicloud_ga_basic_ip_set" "default" {
  accelerator_id       = alicloud_ga_basic_accelerator.default.id
  bandwidth            = var.bandwidth_var
  isp_type             = "BGP"
  accelerate_region_id = "cn-hangzhou"
}
