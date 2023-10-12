data "alicloud_nas_protocols" "example" {
  type = "Performance"
}

data "alicloud_nas_zones" "default" {
  file_system_type = "standard"
}

resource "alicloud_nas_file_system" "example" {
  protocol_type = "${data.alicloud_nas_protocols.example.protocols.0}"
  storage_type  = "Performance"
}

resource "alicloud_nas_mount_target" "default" {
  file_system_id = alicloud_nas_file_system.example.id
}
