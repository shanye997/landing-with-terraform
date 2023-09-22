resource "alicloud_ga_accelerator" "default" {
  description  = var.description_var
  duration     = var.duration_var
  payment_type = "Subscription"
  spec         = var.spec_var
  tags = {
    Created = "TF_Update"
    For     = "Accelerator_Update"
  }
  accelerator_name = var.accelerator_name_var
  auto_use_coupon  = var.auto_use_coupon_var
}
