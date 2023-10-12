resource "alicloud_nas_file_system" "default" {
  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = var.name
  encrypt_type  = "1"
}

resource "alicloud_nas_recycle_bin" "default" {
  file_system_id = alicloud_nas_file_system.default.id
}
