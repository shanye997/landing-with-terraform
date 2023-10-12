resource "alicloud_arms_alert_contact" "default" {
  alert_contact_name = "${var.name}"
  email              = "${var.name}@aaa.com"
}

resource "alicloud_arms_dispatch_rule" "default" {
  dispatch_type = var.dispatch_type_var
  group_rules {
    group_interval  = "15"
    group_wait_time = "5"
    grouping_fields = [
      "alertname"
    ]
    repeat_interval = "80"
  }

  label_match_expression_grid {
    label_match_expression_groups {
      label_match_expressions {
        key      = "_aliyun_arms_involvedObject_kind"
        operator = "eq"
        value    = "app"
      }

    }

  }

  notify_rules {
    notify_channels = [
      "dingTalk",
      "wechat"
    ]
    notify_objects {
      notify_type      = "ARMS_CONTACT"
      name             = var.name
      notify_object_id = alicloud_arms_alert_contact.default.id
    }

  }

  dispatch_rule_name = var.name
}
