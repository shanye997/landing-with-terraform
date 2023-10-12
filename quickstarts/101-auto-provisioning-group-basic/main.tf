data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu"
  most_recent = true
  owners      = "system"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = "${alicloud_vpc.default.id}"
  cidr_block   = "172.16.0.0/24"
  zone_id      = "${data.alicloud_zones.default.zones.0.id}"
  vswitch_name = "${var.name}"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = "${alicloud_vpc.default.id}"
}

resource "alicloud_launch_template" "template" {
  name              = "${var.name}"
  image_id          = "${data.alicloud_images.default.images.0.id}"
  instance_type     = "ecs.n1.tiny"
  security_group_id = "${alicloud_security_group.default.id}"
}

resource "alicloud_auto_provisioning_group" "default" {
  launch_template_id    = alicloud_launch_template.template.id
  total_target_capacity = var.total_target_capacity_var
  launch_template_config {
    weighted_capacity = "1"
    max_price         = "2"
    vswitch_id        = alicloud_vswitch.default.id
  }

}
