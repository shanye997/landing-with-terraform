data "alicloud_resource_manager_resource_groups" "default" {
}

resource "alicloud_arms_prometheus" "default" {
  tags = {
    Created = "TF_Update"
    For     = "Prometheus_Update"
  }
  cluster_name        = "tf-examplecn-hangzhouArmsPrometheus742"
  cluster_type        = "remote-write"
  grafana_instance_id = var.grafana_instance_id_var
  resource_group_id   = data.alicloud_resource_manager_resource_groups.default.groups.1.id
}
