data "alicloud_nas_zones" "default" {
  file_system_type = "standard"
}

locals {
  count_size = length(data.alicloud_nas_zones.default.zones)
  zone_id    = data.alicloud_nas_zones.default.zones[local.count_size - 1].zone_id
}

resource "alicloud_nas_file_system" "default" {
  protocol_type    = "SMB"
  storage_type     = "Capacity"
  description      = var.name
  zone_id          = local.zone_id
  encrypt_type     = "0"
  file_system_type = "standard"
}

resource "alicloud_nas_smb_acl_attachment" "default" {
  home_dir_path             = var.home_dir_path_var
  keytab                    = var.keytab_var
  keytab_md5                = var.keytab_md5_var
  reject_unencrypted_access = var.reject_unencrypted_access_var
  super_admin_sid           = var.super_admin_sid_var
  enable_anonymous_access   = var.enable_anonymous_access_var
  encrypt_data              = var.encrypt_data_var
  file_system_id            = alicloud_nas_file_system.default.id
}
