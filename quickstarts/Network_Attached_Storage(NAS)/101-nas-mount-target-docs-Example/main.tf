data "alicloud_nas_zones" "default" {
  file_system_type = "extreme"
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

resource "alicloud_nas_file_system" "example" {
  protocol_type    = "NFS"
  storage_type     = "advance"
  file_system_type = "extreme"
  capacity         = "100"
  zone_id          = local.zone_id
}

resource "alicloud_nas_access_group" "example" {
  access_group_name = "access_group_xxx"
  access_group_type = "Vpc"
  description       = "test_access_group"
  file_system_type  = "extreme"
}

resource "alicloud_nas_mount_target" "example" {
  file_system_id    = alicloud_nas_file_system.example.id
  access_group_name = alicloud_nas_access_group.example.access_group_name
  vswitch_id        = alicloud_vswitch.example.id
  vpc_id            = alicloud_vpc.example.id
  network_type      = alicloud_nas_access_group.example.access_group_type
}