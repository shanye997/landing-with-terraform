resource "alicloud_cen_instance" "default" {
  name = "${var.name}"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_cen_instance_attachment" "default" {
  instance_id              = "${alicloud_cen_instance.default.id}"
  child_instance_id        = "${data.alicloud_vpcs.default.ids.0}"
  child_instance_type      = "VPC"
  child_instance_region_id = "cn-hangzhou"
}

resource "alicloud_cen_private_zone" "default" {
  access_region_id = "cn-hangzhou"
  cen_id           = alicloud_cen_instance_attachment.default.instance_id
  host_region_id   = "cn-hangzhou"
  host_vpc_id      = alicloud_cen_instance_attachment.default.child_instance_id
}
