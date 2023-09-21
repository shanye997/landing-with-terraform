data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  cpu_core_count    = 1
  memory_size       = 2
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu"
  most_recent = true
  owners      = "system"
}

resource "alicloud_vpc" "foo" {
  cidr_block = "172.16.0.0/12"
  name       = "${var.name}"
}

resource "alicloud_vswitch" "foo" {
  vpc_id            = "${alicloud_vpc.foo.id}"
  cidr_block        = "172.16.0.0/21"
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  name              = "${var.name}"
}

resource "alicloud_havip" "foo" {
  vswitch_id  = "${alicloud_vswitch.foo.id}"
  description = "${var.name}"
}

resource "alicloud_security_group" "tf_test_foo" {
  name        = "${var.name}"
  description = "foo"
  vpc_id      = "${alicloud_vpc.foo.id}"
}

resource "alicloud_instance" "foo" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  vswitch_id        = "${alicloud_vswitch.foo.id}"
  image_id          = "${data.alicloud_images.default.images.0.id}"
  # series III
  instance_type              = "${data.alicloud_instance_types.default.instance_types.0.id}"
  system_disk_category       = "cloud_efficiency"
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = 5
  security_groups            = ["${alicloud_security_group.tf_test_foo.id}"]
  instance_name              = "${var.name}"
  user_data                  = "echo 'net.ipv4.ip_forward=1'>> /etc/sysctl.conf"
}

resource "alicloud_havip_attachment" "default" {
  instance_id   = alicloud_instance.foo.id
  instance_type = "EcsInstance"
  havip_id      = alicloud_havip.foo.id
}
