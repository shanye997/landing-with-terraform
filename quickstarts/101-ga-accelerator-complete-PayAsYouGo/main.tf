resource "alicloud_ga_accelerator" "default" {
  payment_type           = "PayAsYouGo"
  accelerator_name       = var.accelerator_name_var
  bandwidth_billing_type = "CDT"
  description            = var.description_var
  duration               = var.duration_var
  spec                   = var.spec_var
  auto_use_coupon        = var.auto_use_coupon_var
}
