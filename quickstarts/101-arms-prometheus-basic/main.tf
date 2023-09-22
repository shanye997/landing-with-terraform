resource "alicloud_arms_prometheus" "default" {
  grafana_instance_id = var.grafana_instance_id_var
  cluster_type        = "remote-write"
}
