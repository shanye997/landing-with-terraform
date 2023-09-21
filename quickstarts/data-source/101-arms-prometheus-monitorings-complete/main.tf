data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

data "alicloud_resource_manager_resource_groups" "default" {
}

resource "alicloud_security_group" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_arms_prometheus" "default" {
  cluster_type        = "ecs"
  grafana_instance_id = "free"
  vpc_id              = data.alicloud_vpcs.default.ids.0
  vswitch_id          = data.alicloud_vswitches.default.ids.0
  security_group_id   = alicloud_security_group.default.id
  cluster_name        = "${var.name}-${data.alicloud_vpcs.default.ids.0}"
  resource_group_id   = data.alicloud_resource_manager_resource_groups.default.groups.0.id
}

resource "alicloud_arms_prometheus_monitoring" "default" {
  cluster_id  = alicloud_arms_prometheus.default.id
  type        = "customJob"
  config_yaml = "scrape_configs:\n- job_name: prometheus\n  honor_timestamps: false\n  honor_labels: false\n  scheme: http\n  metrics_path: /metric\n  static_configs:\n  - targets:\n    - 127.0.0.1:9090\n"
  status      = "run"
}

data "alicloud_arms_prometheus_monitorings" "default" {
  status     = "stop"
  type       = "probe"
  cluster_id = alicloud_arms_prometheus_monitoring.default.cluster_id
  ids = [
    "${alicloud_arms_prometheus_monitoring.default.id}_fake"
  ]
  name_regex = "${alicloud_arms_prometheus_monitoring.default.monitoring_name}_fake"
}
