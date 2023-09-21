data "alicloud_zones" "default" {}

data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_zones.default.zones[0].id
  cpu_core_count    = 1
  memory_size       = 2
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu_[0-9]+_[0-9]+_x64*"
  most_recent = true
  owners      = "system"
}

resource "alicloud_vpc" "default" {
  vpc_name = var.name
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
  cidr_block   = cidrsubnet(alicloud_vpc.default.cidr_block, 8, 8)
  vswitch_name = var.name
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = alicloud_vpc.default.id
}

resource "alicloud_ecs_instance_set" "default" {
  system_disk_category       = "cloud_efficiency"
  instance_name              = var.name
  vswitch_id                 = alicloud_vswitch.default.id
  instance_charge_type       = "PostPaid"
  internet_max_bandwidth_out = "10"
  security_group_ids = [
    alicloud_security_group.default.id
  ]
  internet_charge_type = "PayByTraffic"
  instance_type        = data.alicloud_instance_types.default.instance_types[0].id
  zone_id              = alicloud_vswitch.default.zone_id
  amount               = "10"
  image_id             = data.alicloud_images.default.images[0].id
  tags = {
    Created = "TF2"
    For     = "Test2"
    Step    = "Update"
  }
}
