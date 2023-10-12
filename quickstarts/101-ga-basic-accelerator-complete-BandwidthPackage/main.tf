resource "alicloud_ga_basic_accelerator" "default" {
  description            = var.description_var
  auto_renew_duration    = var.auto_renew_duration_var
  pricing_cycle          = var.pricing_cycle_var
  auto_renew             = var.auto_renew_var
  auto_use_coupon        = var.auto_use_coupon_var
  duration               = var.duration_var
  bandwidth_billing_type = "BandwidthPackage"
  tags = {
    Created = "TF"
    For     = "BasicAccelerator"
  }
  auto_pay               = var.auto_pay_var
  basic_accelerator_name = var.basic_accelerator_name_var
  payment_type           = "Subscription"
}
