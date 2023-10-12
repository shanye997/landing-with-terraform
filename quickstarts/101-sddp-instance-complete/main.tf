resource "alicloud_sddp_instance" "default" {
  ud_cbool     = var.ud_cbool_var
  period       = var.period_var
  modify_type  = var.modify_type_var
  payment_type = "Subscription"
  udc          = var.udc_var
  sdc          = var.sdc_var
  sd_cbool     = var.sd_cbool_var
  dataphin     = var.dataphin_var
  sddp_version = var.sddp_version_var
}
