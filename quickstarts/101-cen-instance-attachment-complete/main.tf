resource "alicloud_cen_instance" "default" {
  name        = "${var.name}"
  description = var.name
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "192.168.0.0/16"
}

resource "alicloud_cen_instance_attachment" "default" {
  child_instance_id        = alicloud_vpc.default.id
  child_instance_region_id = "cn-hangzhou"
  child_instance_type      = "VPC"
  instance_id              = alicloud_cen_instance.default.id
}
