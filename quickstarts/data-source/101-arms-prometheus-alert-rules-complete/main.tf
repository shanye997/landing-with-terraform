data "alicloud_cs_managed_kubernetes_clusters" "default" {
  name_regex = "Default"
}

resource "alicloud_arms_prometheus_alert_rule" "default" {
  prometheus_alert_rule_name = var.name
  cluster_id                 = data.alicloud_cs_managed_kubernetes_clusters.default.clusters.0.id
  expression                 = "node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100 < 10"
  message                    = "node available memory is less than 10"
  duration                   = 1
  notify_type                = "ALERT_MANAGER"
  type                       = var.name
  labels {
    name  = "TF"
    value = "Test"
  }
}

data "alicloud_arms_prometheus_alert_rules" "default" {
  match_expressions = "node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100 < 20"
  name_regex        = "${alicloud_arms_prometheus_alert_rule.default.prometheus_alert_rule_name}_fake"
  status            = "0"
  type              = "${alicloud_arms_prometheus_alert_rule.default.type}_fake"
  cluster_id        = data.alicloud_cs_managed_kubernetes_clusters.default.clusters.0.id
  ids = [
    "${alicloud_arms_prometheus_alert_rule.default.id}_fake"
  ]
}
