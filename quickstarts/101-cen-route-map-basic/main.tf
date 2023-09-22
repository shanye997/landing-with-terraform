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

resource "alicloud_cen_route_map" "default" {
  map_result         = var.map_result_var
  priority           = var.priority_var
  transmit_direction = "RegionIn"
  cen_id             = alicloud_cen_instance.default.id
  cen_region_id      = var.vpc_region_00
  depends_on = [
    alicloud_cen_instance_attachment.default00,
    alicloud_cen_instance_attachment.default01
  ]
}
