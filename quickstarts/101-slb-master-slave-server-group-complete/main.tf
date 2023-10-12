data "alicloud_instance_types" "default" {
  eni_amount = 2
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
  vpc_id            = "${alicloud_vpc.default.id}"
  cidr_block        = "172.16.0.0/16"
  availability_zone = "${data.alicloud_instance_types.default.instance_types.0.availability_zones.0}"
  name              = "${var.name}"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = "${alicloud_vpc.default.id}"
}

resource "alicloud_instance" "default" {
  image_id                   = "${data.alicloud_images.default.images.0.id}"
  instance_type              = "${data.alicloud_instance_types.default.instance_types.0.id}"
  instance_name              = "${var.name}"
  count                      = "2"
  security_groups            = "${alicloud_security_group.default.*.id}"
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = "10"
  availability_zone          = "${data.alicloud_instance_types.default.instance_types.0.availability_zones.0}"
  instance_charge_type       = "PostPaid"
  system_disk_category       = "cloud_efficiency"
  vswitch_id                 = "${alicloud_vswitch.default.id}"
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = "${var.name}"
  vswitch_id         = "${alicloud_vswitch.default.id}"
  load_balancer_spec = "slb.s2.small"
}

resource "alicloud_slb_master_slave_server_group" "default" {
  load_balancer_id = alicloud_slb_load_balancer.default.id
  name             = var.name
  servers {
    port        = "100"
    server_id   = alicloud_instance.default.0.id
    server_type = "Master"
    weight      = "100"
  }
  servers {
    port        = "100"
    server_id   = alicloud_instance.default.1.id
    server_type = "Slave"
    weight      = "100"
  }

}
