resource "alicloud_ga_basic_accelerator" "default" {
  description  = var.description_var
  payment_type = "PayAsYouGo"
  tags = {
    Created = "TF"
    For     = "BasicAccelerator"
  }
  bandwidth_billing_type = "CDT"
  basic_accelerator_name = var.basic_accelerator_name_var
}
