data "alicloud_nas_zones" "default" {
  file_system_type = "extreme"
}

locals {
  count_size = length(data.alicloud_nas_zones.default.zones)
}

resource "alicloud_nas_file_system" "default" {
  file_system_type = "extreme"
  protocol_type    = "NFS"
  zone_id          = data.alicloud_nas_zones.default.zones[local.count_size - 1].zone_id
  storage_type     = "standard"
  description      = var.name
  capacity         = 100
}

resource "alicloud_nas_snapshot" "default" {
  file_system_id = alicloud_nas_file_system.default.id
}
