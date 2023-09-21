resource "alicloud_cms_metric_rule_black_list" "default" {
  metrics {
    metric_name = "disk_utilization"
  }

  namespace         = "acs_ecs_dashboard"
  category          = var.category_var
  enable_end_time   = var.enable_end_time_var
  enable_start_time = var.enable_start_time_var
  instances = [
    "{\"instanceId\":\"instance_id_to_test\"}"
  ]
  metric_rule_black_list_name = "henghai1342432432432"
}
