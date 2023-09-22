data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = data.alicloud_vpcs.default.ids.0
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_ecs_network_interface" "default" {
  queue_number = var.queue_number_var
  tags = {
    Created = "TF"
    For     = "Test"
  }
  vswitch_id  = data.alicloud_vswitches.default.ids.0
  description = var.description_var
  private_ip_addresses = [
    cidrhost(data.alicloud_vswitches.default.vswitches.0.cidr_block, 24),
    cidrhost(data.alicloud_vswitches.default.vswitches.0.cidr_block, 25)
  ]
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
  security_group_ids = [
    alicloud_security_group.default.id
  ]
  network_interface_name = var.network_interface_name_var
}
