data "alicloud_nas_protocols" "example" {
  type = "Capacity"
}

data "alicloud_nas_zones" "default" {
}

resource "alicloud_nas_file_system" "default" {
  zone_id       = data.alicloud_nas_zones.default.zones.0.zone_id
  description   = var.description_var
  protocol_type = data.alicloud_nas_protocols.example.protocols.0
  storage_type  = "Capacity"
  tags = {
    Created = "TF2"
    For     = "Test2"
  }
}
