resource "alicloud_cms_monitor_group" "new" {
  monitor_group_name = "${var.name}_new"
}

resource "alicloud_cms_event_rule" "default" {
  description = var.description_var
  event_pattern {
    event_type_list = [
      "Exception"
    ]
    level_list = [
      "WARN"
    ]
    name_list = [
      "update_test"
    ]
    product    = "ads"
    sql_filter = "update_test"
  }

  group_id     = alicloud_cms_monitor_group.new.id
  rule_name    = "tf-examplecn-hangzhouCmsEventRule-name32515"
  silence_time = var.silence_time_var
  status       = var.status_var
}
