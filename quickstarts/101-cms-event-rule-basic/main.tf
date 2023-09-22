resource "alicloud_cms_event_rule" "default" {
  event_pattern {
    level_list = [
      "WARN"
    ]
    name_list = [
      "update_test"
    ]
    product    = "ads"
    sql_filter = "update_test"
    event_type_list = [
      "Exception"
    ]
  }

  rule_name = "tf-examplecn-hangzhouCmsEventRule-name32515"
}
