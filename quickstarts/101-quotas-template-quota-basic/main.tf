resource "alicloud_quotas_template_quota" "default" {
  desire_value      = var.desire_value_var
  product_code      = "gws"
  quota_action_code = "q_desktop-count"
}
