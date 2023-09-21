data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
}

resource "alicloud_cen_instance_attachment" "vpc" {
  instance_id              = alicloud_cen_instance.default.id
  child_instance_id        = data.alicloud_vpcs.default.ids.0
  child_instance_type      = "VPC"
  child_instance_region_id = "cn-hangzhou"
}

resource "alicloud_cen_route_service" "default" {
  host_vpc_id      = alicloud_cen_instance_attachment.vpc.child_instance_id
  host             = "100.118.28.52/32"
  access_region_id = alicloud_cen_instance_attachment.vpc.child_instance_region_id
  cen_id           = alicloud_cen_instance_attachment.vpc.instance_id
  host_region_id   = alicloud_cen_instance_attachment.vpc.child_instance_region_id
}
