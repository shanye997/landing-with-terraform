resource "alicloud_cen_instance" "default" {
  cen_instance_name = "${var.name}"
}

provider "alicloud" {
  alias  = "vpc00_region"
  region = "${var.vpc_region_00}"
}

data "alicloud_vpcs" "vpc00" {
  provider   = "alicloud.vpc00_region"
  name_regex = "default-NODELETING"
}

data "alicloud_vpcs" "vpc01" {
  provider   = "alicloud.vpc01_region"
  name_regex = "default-NODELETING"
}

resource "alicloud_cen_instance_attachment" "default00" {
  instance_id              = "${alicloud_cen_instance.default.id}"
  child_instance_id        = "${data.alicloud_vpcs.vpc00.ids.0}"
  child_instance_type      = "VPC"
  child_instance_region_id = "${var.vpc_region_00}"
}

resource "alicloud_cen_instance_attachment" "default01" {
  instance_id              = "${alicloud_cen_instance.default.id}"
  child_instance_id        = "${data.alicloud_vpcs.vpc01.ids.0}"
  child_instance_type      = "VPC"
  child_instance_region_id = "${var.vpc_region_01}"
}

data "alicloud_vpcs" "vpc" {
  name_regex = "default-NODELETING"
}

resource "alicloud_cen_transit_router" "default" {
  cen_id = alicloud_cen_instance.default.id
}

resource "alicloud_cen_transit_router_route_table" "default" {
  transit_router_id                      = alicloud_cen_transit_router.default.transit_router_id
  transit_router_route_table_name        = var.name
  transit_router_route_table_description = "description"
}

resource "alicloud_cen_route_map" "default" {
  transmit_direction                = "RegionIn"
  transit_router_route_table_id     = alicloud_cen_transit_router_route_table.default.transit_router_route_table_id
  description                       = var.description_var
  source_instance_ids_reverse_match = var.source_instance_ids_reverse_match_var
  source_instance_ids = [
    data.alicloud_vpcs.vpc00.ids.0
  ]
  destination_instance_ids_reverse_match = var.destination_instance_ids_reverse_match_var
  community_match_mode                   = var.community_match_mode_var
  cidr_match_mode                        = var.cidr_match_mode_var
  match_community_set = [
    "65500:1"
  ]
  next_priority = var.next_priority_var
  priority      = var.priority_var
  destination_cidr_blocks = [
    data.alicloud_vpcs.vpc01.vpcs.0.cidr_block
  ]
  destination_route_table_ids = [
    data.alicloud_vpcs.vpc01.vpcs.0.route_table_id
  ]
  source_region_ids = [
    var.vpc_region_00
  ]
  match_asns = [
    "65500"
  ]
  cen_id = alicloud_cen_instance.default.id
  operate_community_set = [
    "65500:1"
  ]
  destination_instance_ids = [
    data.alicloud_vpcs.vpc01.ids.0
  ]
  source_route_table_ids = [
    data.alicloud_vpcs.vpc00.vpcs.0.route_table_id
  ]
  depends_on = [
    alicloud_cen_instance_attachment.default00,
    alicloud_cen_instance_attachment.default01
  ]
  as_path_match_mode     = var.as_path_match_mode_var
  cen_region_id          = var.vpc_region_00
  community_operate_mode = var.community_operate_mode_var
  map_result             = var.map_result_var
}
