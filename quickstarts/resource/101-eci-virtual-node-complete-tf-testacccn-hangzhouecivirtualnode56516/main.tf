data "alicloud_eci_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_eci_zones.default.zones.0.zone_ids.0
}

resource "alicloud_security_group" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
  name   = var.name
}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_eci_virtual_node" "default" {
  virtual_node_name = "tf-examplecn-hangzhouecivirtualnode56516"
  vswitch_id        = data.alicloud_vswitches.default.ids.0
  kube_config       = var.kube_config
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  security_group_id = alicloud_security_group.default.id
}
