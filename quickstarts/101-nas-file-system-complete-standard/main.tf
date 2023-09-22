resource "alicloud_kms_key" "key" {
  description            = var.name
  pending_window_in_days = "7"
  key_state              = "Enabled"
}

data "alicloud_nas_zones" "default" {
  file_system_type = "extreme"
}

locals {
  count_size = length(data.alicloud_nas_zones.default.zones)
  zone_id    = data.alicloud_nas_zones.default.zones[local.count_size - 1].zone_id
}

resource "alicloud_nas_file_system" "default" {
  encrypt_type = "2"
  capacity     = var.capacity_var
  storage_type = "standard"
  tags = {
    Created = "TF2"
    For     = "Test2"
  }
  protocol_type    = "NFS"
  kms_key_id       = alicloud_kms_key.key.id
  file_system_type = "extreme"
  description      = var.description_var
  zone_id          = local.zone_id
}
