data "alicloud_zones" default {
  available_resource_creation = "Instance"
}

data "alicloud_instance_types" "default" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  cpu_core_count    = 1
  memory_size       = 2
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name        = "${var.name}"
  description = "New security group"
  vpc_id      = data.alicloud_vpcs.default.ids.0
}

data "alicloud_images" "default" {
  owners      = "system"
  name_regex  = "^centos_8"
  most_recent = true
}

resource "alicloud_instance" "default" {
  availability_zone          = "${data.alicloud_zones.default.zones.0.id}"
  instance_name              = "${var.name}"
  host_name                  = "tf-example"
  internet_max_bandwidth_out = 10
  image_id                   = data.alicloud_images.default.images.0.id
  instance_type              = data.alicloud_instance_types.default.instance_types.0.id
  security_groups            = [alicloud_security_group.default.id]
  vswitch_id                 = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_ddos_basic_threshold" "default" {
  internet_ip   = alicloud_instance.default.public_ip
  pps           = var.pps_var
  bps           = var.bps_var
  instance_id   = alicloud_instance.default.id
  instance_type = "ecs"
}
