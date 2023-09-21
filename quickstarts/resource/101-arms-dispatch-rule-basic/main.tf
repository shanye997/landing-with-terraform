resource "alicloud_arms_alert_contact" "default" {
  alert_contact_name = "${var.name}"
  email              = "${var.name}@aaa.com"
}

resource "alicloud_arms_dispatch_rule" "default" {
  label_match_expression_grid {
    label_match_expression_groups {
      label_match_expressions {
        operator = "eq"
        value    = "app"
        key      = "_aliyun_arms_involvedObject_kind"
      }

    }

  }

  dispatch_rule_name = var.name
  notify_rules {
    notify_channels = [
      "dingTalk",
      "wechat"
    ]
    notify_objects {
      name             = var.name
      notify_object_id = alicloud_arms_alert_contact.default.id
      notify_type      = "ARMS_CONTACT"
    }

  }

  group_rules {
    grouping_fields = [
      "alertname"
    ]
    repeat_interval = "80"
    group_interval  = "15"
    group_wait_time = "5"
  }

}
