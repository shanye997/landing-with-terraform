resource "alicloud_quotas_quota_alarm" "default" {
  quota_action_code = "q_prepaid-instance-count-per-once-purchase"
  quota_alarm_name  = var.quota_alarm_name_var
  quota_dimensions {
    key   = "regionId"
    value = "cn-hangzhou"
  }

  web_hook          = var.web_hook_var
  threshold_percent = var.threshold_percent_var
  threshold_type    = var.threshold_type_var
  threshold         = var.threshold_var
  product_code      = "ecs"
}
