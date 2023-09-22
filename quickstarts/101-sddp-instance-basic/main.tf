resource "alicloud_sddp_instance" "default" {
  sddp_version = var.sddp_version_var
  sdc          = var.sdc_var
  payment_type = "Subscription"
  sd_cbool     = var.sd_cbool_var
  ud_cbool     = var.ud_cbool_var
  period       = var.period_var
  udc          = var.udc_var
}
