data "alicloud_cs_managed_kubernetes_clusters" "default" {
  name_regex = "Default"
}

data "alicloud_arms_prometheus_alert_rules" "default" {
  cluster_id = data.alicloud_cs_managed_kubernetes_clusters.default.clusters.0.id
}
