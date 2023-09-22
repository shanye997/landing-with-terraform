resource "alicloud_vpc_traffic_mirror_filter" "default" {
  count                      = 2
  traffic_mirror_filter_name = var.name
}

data "alicloud_instance_types" "default" {
  instance_type_family = "ecs.g7"
}

data "alicloud_zones" "default" {
  available_resource_creation = "Instance"
  available_instance_type     = data.alicloud_instance_types.default.instance_types.0.id
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

locals {
  vswitch_id = data.alicloud_vswitches.default.ids[0]
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = var.name
  address_type       = "intranet"
  load_balancer_spec = "slb.s2.small"
  vswitch_id         = local.vswitch_id
}

resource "alicloud_security_group" "default" {
  name        = var.name
  description = var.name
  vpc_id      = data.alicloud_vpcs.default.ids.0
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu_[0-9]+_[0-9]+_x64*"
  most_recent = true
  owners      = "system"
}

resource "alicloud_instance" "default" {
  count                = 3
  availability_zone    = data.alicloud_zones.default.zones.0.id
  instance_name        = var.name
  host_name            = var.name
  image_id             = data.alicloud_images.default.images.0.id
  instance_type        = data.alicloud_instance_types.default.instance_types.0.id
  security_groups      = [alicloud_security_group.default.id]
  vswitch_id           = local.vswitch_id
  system_disk_category = "cloud_essd"
}

resource "alicloud_ecs_network_interface" "default" {
  count                  = 3
  network_interface_name = var.name
  vswitch_id             = local.vswitch_id
  security_group_ids     = [alicloud_security_group.default.id]
}

resource "alicloud_ecs_network_interface_attachment" "default" {
  count                = 3
  instance_id          = element(alicloud_instance.default.*.id, count.index)
  network_interface_id = element(alicloud_ecs_network_interface.default.*.id, count.index)
}

data "alicloud_resource_manager_resource_groups" "default" {
}

resource "alicloud_vpc_traffic_mirror_session" "default" {
  packet_length                      = "1300"
  traffic_mirror_session_description = "${var.name}"
  traffic_mirror_session_name        = "${var.name}"
  enabled                            = var.enabled_var
  traffic_mirror_filter_id           = alicloud_vpc_traffic_mirror_filter.default.1.id
  traffic_mirror_target_type         = var.traffic_mirror_target_type_var
  resource_group_id                  = data.alicloud_resource_manager_resource_groups.default.groups.1.id
  virtual_network_id                 = var.virtual_network_id_var
  traffic_mirror_source_ids = [
    alicloud_ecs_network_interface_attachment.default[0].network_interface_id
  ]
  priority = var.priority_var
  tags = {
    Created = "TF"
    For     = "Test"
  }
  traffic_mirror_target_id = alicloud_slb_load_balancer.default.id
  dry_run                  = var.dry_run_var
}
