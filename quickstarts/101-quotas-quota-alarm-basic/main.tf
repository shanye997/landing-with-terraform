resource "alicloud_quotas_quota_alarm" "default" {
  quota_action_code = "q_prepaid-instance-count-per-once-purchase"
  quota_alarm_name  = var.quota_alarm_name_var
  product_code      = "ecs"
}
