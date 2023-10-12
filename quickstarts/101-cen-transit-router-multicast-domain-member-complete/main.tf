data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = data.alicloud_vpcs.default.ids.0
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_ecs_network_interface" "default" {
  network_interface_name = var.name
  vswitch_id             = data.alicloud_vswitches.default.ids.0
  security_group_ids     = [alicloud_security_group.default.id]
  description            = "Basic test"
  primary_ip_address     = cidrhost(data.alicloud_vswitches.default.vswitches.0.cidr_block, 100)
  tags = {
    Created = "TF",
    For     = "Test",
  }
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
}

data "alicloud_cen_instances" "default" {
  name_regex = "no-deleting-cen"
}

data "alicloud_cen_transit_routers" "default" {
  cen_id     = data.alicloud_cen_instances.default.instances.0.id
  name_regex = "no-deleting-cen"
}

data "alicloud_cen_transit_router_multicast_domains" "default" {
  transit_router_id = data.alicloud_cen_transit_routers.default.transit_routers.0.transit_router_id
  name_regex        = "no-deleting-cen"
}

resource "alicloud_cen_transit_router_multicast_domain_member" "default" {
  group_ip_address                   = "224.0.0.8"
  network_interface_id               = alicloud_ecs_network_interface.default.id
  transit_router_multicast_domain_id = data.alicloud_cen_transit_router_multicast_domains.default.ids.0
  vpc_id                             = data.alicloud_vpcs.default.ids.0
}
