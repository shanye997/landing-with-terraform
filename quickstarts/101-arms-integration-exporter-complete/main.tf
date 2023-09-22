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

resource "alicloud_arms_integration_exporter" "default" {
  cluster_id       = alicloud_arms_prometheus.default.id
  integration_type = "kafka"
  param            = var.param_var
}
