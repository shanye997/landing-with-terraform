resource "alicloud_quotas_template_quota" "default" {
  expire_time       = var.expire_time_var
  product_code      = "gws"
  desire_value      = var.desire_value_var
  notice_type       = var.notice_type_var
  quota_action_code = "q_desktop-count"
  quota_category    = var.quota_category_var
  effective_time    = var.effective_time_var
  dimensions {
    key   = "regionId"
    value = "cn-hangzhou"
  }

  env_language = var.env_language_var
}
