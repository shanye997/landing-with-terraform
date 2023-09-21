data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

data "alicloud_resource_manager_resource_groups" "default" {
}

resource "alicloud_lindorm_instance" "default_0" {
  file_engine_specification = var.file_engine_specification_var
  resource_group_id         = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  vswitch_id                = data.alicloud_vswitches.default.ids[0]
  payment_type              = "PayAsYouGo"
  tags = {
    Created = "TF_Update"
    For     = "HITS Update"
  }
  zone_id                = data.alicloud_zones.default.zones.0.id
  instance_name          = var.name
  instance_storage       = var.instance_storage_var
  disk_category          = "cloud_essd_pl0"
  file_engine_node_count = var.file_engine_node_count_var
}
