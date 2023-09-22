data "alicloud_cs_managed_kubernetes_clusters" "default" {
  name_regex = "Default"
}

resource "alicloud_arms_prometheus_alert_rule" "default" {
  duration                   = "1"
  prometheus_alert_rule_name = "tf-examplecn-hangzhouarmsprometheusalertrule28516"
  message                    = "node available memory is less than 20%"
  cluster_id                 = data.alicloud_cs_managed_kubernetes_clusters.default.clusters.0.id
  expression                 = "node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100 < 20"
}
