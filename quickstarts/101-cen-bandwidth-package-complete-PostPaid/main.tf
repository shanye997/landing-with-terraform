resource "alicloud_cen_bandwidth_package" "default" {
  payment_type               = "PostPaid"
  geographic_region_a_id     = "China"
  geographic_region_b_id     = "China"
  description                = var.name
  bandwidth                  = var.bandwidth_var
  period                     = var.period_var
  cen_bandwidth_package_name = var.name
}
