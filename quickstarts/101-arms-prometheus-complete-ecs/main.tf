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
  tags = {
    Created = "TF_Update"
    For     = "Prometheus_Update"
  }
  vpc_id              = data.alicloud_vpcs.default.ids.0
  vswitch_id          = data.alicloud_vswitches.default.ids.0
  cluster_name        = "tf-examplecn-hangzhou-${data.alicloud_vpcs.default.ids.0}"
  cluster_type        = "ecs"
  grafana_instance_id = var.grafana_instance_id_var
  resource_group_id   = data.alicloud_resource_manager_resource_groups.default.groups.1.id
  security_group_id   = alicloud_security_group.default.id
}
