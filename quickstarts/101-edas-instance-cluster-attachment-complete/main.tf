data "alicloud_instance_types" "default" {
  cpu_core_count = 1
  memory_size    = 2
}

resource "alicloud_vpc" "default" {
  cidr_block = "172.16.0.0/12"
  name       = "${var.name}"
}

resource "alicloud_vswitch" "default" {
  vpc_id            = "${alicloud_vpc.default.id}"
  cidr_block        = "172.16.0.0/24"
  availability_zone = "${data.alicloud_instance_types.default.instance_types.0.availability_zones.0}"
  name              = "${var.name}"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = "${alicloud_vpc.default.id}"
}

resource "alicloud_instance" "default" {
  instance_type        = "${data.alicloud_instance_types.default.instance_types.0.id}"
  system_disk_category = "cloud_efficiency"
  image_id             = "centos_7_06_64_20G_alibase_20190711.vhd"
  instance_name        = "${var.name}"
  vswitch_id           = alicloud_vswitch.default.id
  security_groups      = ["${alicloud_security_group.default.id}"]
}

resource "alicloud_edas_cluster" "default" {
  cluster_name = "${var.name}"
  cluster_type = 2
  network_mode = 2
  vpc_id       = "${alicloud_vpc.default.id}"
}

resource "alicloud_edas_instance_cluster_attachment" "default" {
  cluster_id = alicloud_edas_cluster.default.id
  instance_ids = [
    alicloud_instance.default.id
  ]
}
