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
  group_id              = alicloud_cms_monitor_group.default.id
  webhook               = var.webhook_var
  namespace             = "acs_ecs_dashboard"
  period                = var.period_var
  category              = "ecs"
  no_effective_interval = var.no_effective_interval_var
  escalations {
    critical {
      comparison_operator = "GreaterThanOrEqualToThreshold"
      statistics          = "Average"
      threshold           = "90"
      times               = "3"
    }

  }

  effective_interval     = var.effective_interval_var
  group_metric_rule_name = var.name
  metric_name            = var.metric_name_var
  rule_id                = "4a9a8978-a9cc-55ca-aa7c-530ccd91ae57"
  silence_time           = var.silence_time_var
  email_subject          = var.email_subject_var
  targets {
    id    = "1"
    level = "Critical"
    arn   = "acs:mns:cn-hangzhou::/queues/test/message"
  }

}
