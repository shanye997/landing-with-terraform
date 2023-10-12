data "alicloud_nas_zones" "default" {
  file_system_type = "cpfs"
}

resource "alicloud_nas_file_system" "default" {
  storage_type  = "advance_200"
  protocol_type = "cpfs"
}
