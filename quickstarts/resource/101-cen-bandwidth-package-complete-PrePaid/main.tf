resource "alicloud_cen_bandwidth_package" "default" {
  bandwidth                  = var.bandwidth_var
  cen_bandwidth_package_name = var.name
  payment_type               = "PrePaid"
  period                     = var.period_var
}
