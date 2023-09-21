resource "alicloud_cms_alarm_contact_group" "default" {
  alarm_contact_group_name = var.name
  describe                 = "tf-example"
  contacts                 = ["zhangsan", "lisi", "lll"]
}

resource "alicloud_cms_monitor_group" "default" {
  monitor_group_name = var.name
  contact_groups     = [alicloud_cms_alarm_contact_group.default.id]
}

resource "alicloud_cms_group_metric_rule" "default" {
  namespace              = "acs_ecs_dashboard"
  category               = "ecs"
  group_metric_rule_name = var.name
  rule_id                = "4a9a8978-a9cc-55ca-aa7c-530ccd91ae57"
  metric_name            = var.metric_name_var
  group_id               = alicloud_cms_monitor_group.default.id
  escalations {
    critical {
      statistics          = "Average"
      threshold           = "90"
      times               = "3"
      comparison_operator = "GreaterThanOrEqualToThreshold"
    }

  }

}
