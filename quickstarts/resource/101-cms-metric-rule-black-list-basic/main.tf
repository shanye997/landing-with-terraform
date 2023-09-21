resource "alicloud_cms_metric_rule_black_list" "default" {
  namespace = "acs_ecs_dashboard"
  metrics {
    metric_name = "disk_utilization"
  }

  category = var.category_var
  instances = [
    "{\"instanceId\":\"instance_id_to_test\"}"
  ]
  metric_rule_black_list_name = "henghai1342432432432"
}
