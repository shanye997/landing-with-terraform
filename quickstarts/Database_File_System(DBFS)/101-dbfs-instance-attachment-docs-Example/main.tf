variable "name" {
  default = "tf-example"
}
provider "alicloud" {
  region = "cn-hangzhou"
}

locals {
  zone_id = "cn-hangzhou-i"
}
data "alicloud_instance_types" "example" {
  availability_zone    = local.zone_id
  instance_type_family = "ecs.g7se"
}
data "alicloud_images" "example" {
  instance_type = data.alicloud_instance_types.example.instance_types[length(data.alicloud_instance_types.example.instance_types) - 1].id
  name_regex    = "^aliyun_2"
  owners        = "system"
}

resource "alicloud_vpc" "example" {
  vpc_name   = var.name
  cidr_block = "10.4.0.0/16"
}

resource "alicloud_vswitch" "example" {
  vswitch_name = var.name
  cidr_block   = "10.4.0.0/24"
  vpc_id       = alicloud_vpc.example.id
  zone_id      = local.zone_id
}
resource "alicloud_security_group" "example" {
  name   = var.name
  vpc_id = alicloud_vpc.example.id
}

resource "alicloud_instance" "example" {
  availability_zone    = local.zone_id
  instance_name        = var.name
  image_id             = data.alicloud_images.example.images.1.id
  instance_type        = data.alicloud_instance_types.example.instance_types[length(data.alicloud_instance_types.example.instance_types) - 1].id
  security_groups      = [alicloud_security_group.example.id]
  vswitch_id           = alicloud_vswitch.example.id
  system_disk_category = "cloud_essd"
}

resource "alicloud_dbfs_instance" "example" {
  category          = "standard"
  zone_id           = local.zone_id
  performance_level = "PL1"
  instance_name     = var.name
  size              = 100
}

resource "alicloud_dbfs_instance_attachment" "example" {
  ecs_id      = alicloud_instance.example.id
  instance_id = alicloud_dbfs_instance.example.id
}