data "alicloud_resource_manager_resource_groups" "default" {
}

data "alicloud_instances" "default" {
  status = "Running"
}

resource "alicloud_bp_studio_application" "default" {
  template_id = "YAUUQIYRSV1CMFGX"
  variables = {

  }
  application_name = "tf-exampleBpStudioApplication-name71625"
  area_id          = "cn-hangzhou"
  configuration = {

  }
  instances {
    id        = data.alicloud_instances.default.instances.0.id
    node_name = data.alicloud_instances.default.instances.0.name
    node_type = "ecs"
  }

  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
}
