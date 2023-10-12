data "alicloud_nas_zones" "default" {
  file_system_type = "cpfs"
}

locals {
  count_size = length(data.alicloud_nas_zones.default.zones)
  zone_id    = data.alicloud_nas_zones.default.zones[local.count_size - 1].zone_id
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = local.zone_id
}

resource "alicloud_nas_file_system" "default" {
  protocol_type    = "cpfs"
  storage_type     = "advance_200"
  file_system_type = "cpfs"
  capacity         = 3600
  description      = "tf-example"
  zone_id          = local.zone_id
  vpc_id           = data.alicloud_vpcs.default.ids.0
  vswitch_id       = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_nas_mount_target" "default" {
  file_system_id = "${alicloud_nas_file_system.default.id}"
  vswitch_id     = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_oss_bucket" "default" {
  bucket = var.name
  acl    = "private"
  tags = {
    cpfs-dataflow = "true"
  }
}

resource "alicloud_nas_fileset" "default" {
  depends_on       = ["alicloud_nas_mount_target.default"]
  file_system_id   = alicloud_nas_file_system.default.id
  description      = var.name
  file_system_path = "/tf-example-Path/"
}

resource "alicloud_nas_data_flow" "default" {
  throughput           = var.throughput_var
  description          = var.name
  dry_run              = var.dry_run_var
  file_system_id       = alicloud_nas_file_system.default.id
  fset_id              = alicloud_nas_fileset.default.fileset_id
  source_security_type = "SSL"
  source_storage       = "oss://${alicloud_oss_bucket.default.bucket}"
  status               = var.status_var
}
