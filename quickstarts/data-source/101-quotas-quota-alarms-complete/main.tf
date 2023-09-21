resource "alicloud_quotas_quota_alarm" "default" {
  quota_alarm_name  = "tf-exampleQuotasQuotaAlarmsTest24824"
  product_code      = "ecs"
  quota_action_code = "q_prepaid-instance-count-per-once-purchase"
  threshold         = "100"
  quota_dimensions {
    key   = "regionId"
    value = "cn-hangzhou"
  }
}

data "alicloud_quotas_quota_alarms" "default" {
  enable_details = var.enable_details_var
  ids = [
    "${alicloud_quotas_quota_alarm.default.id}-fake"
  ]
  name_regex = "tf-exampleQuotasQuotaAlarmsTest24824"
  quota_dimensions {
    key   = "regionId"
    value = "cn-hangzhou"
  }

}
