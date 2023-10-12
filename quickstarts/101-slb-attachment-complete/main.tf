data "alicloud_instance_types" "default" {
  cpu_core_count    = 1
  memory_size       = 2
  availability_zone = data.alicloud_slb_zones.default.zones.0.id
}

data "alicloud_instance_types" "new" {
  eni_amount        = 2
  availability_zone = data.alicloud_slb_zones.default.zones.0.id
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu_[0-9]+_[0-9]+_x64*"
  most_recent = true
  owners      = "system"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_slb_zones" "default" {
  available_slb_address_type = "vpc"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_slb_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_ecs_network_interface" "default" {
  count           = 1
  name            = "${var.name}"
  vswitch_id      = data.alicloud_vswitches.default.ids[0]
  security_groups = ["${alicloud_security_group.default.id}"]
}

resource "alicloud_instance" "default" {
  # cn-beijing
  image_id = "${data.alicloud_images.default.images.0.id}"

  # series III
  instance_type              = "${data.alicloud_instance_types.default.instance_types.0.id}"
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = "5"
  system_disk_category       = "cloud_efficiency"
  count                      = 2
  security_groups            = ["${alicloud_security_group.default.id}"]
  instance_name              = "${var.name}"
  vswitch_id                 = data.alicloud_vswitches.default.ids[0]
  availability_zone          = "${data.alicloud_instance_types.default.instance_types.0.availability_zones.0}"
}

resource "alicloud_instance" "new" {
  image_id                   = "${data.alicloud_images.default.images.0.id}"
  instance_type              = "${data.alicloud_instance_types.new.instance_types.0.id}"
  instance_name              = "${var.name}"
  count                      = "1"
  security_groups            = "${alicloud_security_group.default.*.id}"
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = "10"
  availability_zone          = "${data.alicloud_instance_types.new.instance_types.0.availability_zones.0}"
  instance_charge_type       = "PostPaid"
  system_disk_category       = "cloud_efficiency"
  vswitch_id                 = data.alicloud_vswitches.default.ids[0]
}

resource "alicloud_ecs_network_interface_attachment" "default" {
  count                = 1
  instance_id          = "${alicloud_instance.new.0.id}"
  network_interface_id = "${element(alicloud_ecs_network_interface.default.*.id, count.index)}"
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = "${var.name}"
  vswitch_id         = data.alicloud_vswitches.default.ids[0]
  load_balancer_spec = "slb.s2.small"
}

resource "alicloud_slb_attachment" "default" {
  weight = var.weight_var
  depends_on = [
    alicloud_ecs_network_interface_attachment.default
  ]
  instance_ids = [
    alicloud_instance.default.0.id
  ]
  load_balancer_id = alicloud_slb_load_balancer.default.id
  server_type      = var.server_type_var
}
