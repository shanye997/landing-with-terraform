data "alicloud_nas_protocols" "example" {
  type = "Performance"
}

data "alicloud_nas_zones" "default" {
  file_system_type = "standard"
}

locals {
  count_size = length(data.alicloud_nas_zones.default.zones)
  zone_id    = data.alicloud_nas_zones.default.zones[local.count_size - 1].zone_id
}

resource "alicloud_vpc" "main" {
  vpc_name   = "terraform-example"
  cidr_block = "172.17.3.0/24"
}

resource "alicloud_vswitch" "main" {
  vswitch_name = alicloud_vpc.main.vpc_name
  cidr_block   = alicloud_vpc.main.cidr_block
  vpc_id       = alicloud_vpc.main.id
  zone_id      = local.zone_id
}

resource "alicloud_security_group" "example" {
  name   = var.name
  vpc_id = "${alicloud_vpc.main.id}"
}

resource "alicloud_nas_file_system" "example" {
  protocol_type = "${data.alicloud_nas_protocols.example.protocols.0}"
  storage_type  = "Performance"
}

resource "alicloud_nas_access_group" "example" {
  access_group_name = "${var.name}"
  access_group_type = "Vpc"
}

resource "alicloud_nas_access_group" "example1" {
  access_group_name = "${var.name1}"
  access_group_type = "Vpc"
}

resource "alicloud_nas_mount_target" "default" {
  vswitch_id        = alicloud_vswitch.main.id
  access_group_name = alicloud_nas_access_group.example1.access_group_name
  file_system_id    = alicloud_nas_file_system.example.id
  network_type      = alicloud_nas_access_group.example.access_group_type
  vpc_id            = alicloud_vpc.main.id
  security_group_id = alicloud_security_group.example.id
  status            = var.status_var
}
