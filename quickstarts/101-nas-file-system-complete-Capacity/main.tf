data "alicloud_nas_zones" "default" {
}

resource "alicloud_nas_file_system" "default" {
  encrypt_type  = "1"
  protocol_type = "NFS"
  storage_type  = "Capacity"
  tags = {
    Created = "TF2"
    For     = "Test2"
  }
  zone_id     = data.alicloud_nas_zones.default.zones.0.zone_id
  description = var.description_var
}
