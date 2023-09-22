data "alicloud_gpdb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_gpdb_zones.default.ids.0
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_gpdb_zones.default.ids.0
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_kms_key" "default" {
  description             = var.name
  deletion_window_in_days = 7
  status                  = "Enabled"
}

resource "alicloud_gpdb_elastic_instance" "default" {
  seg_node_num            = "4"
  seg_storage_type        = "cloud_essd"
  engine_version          = "6.0"
  vswitch_id              = local.vswitch_id
  engine                  = "gpdb"
  instance_spec           = "2C16G"
  encryption_key          = alicloud_kms_key.default.id
  storage_size            = "50"
  db_instance_description = var.db_instance_description_var
  security_ip_list = [
    "10.168.1.13"
  ]
  db_instance_category = "HighAvailability"
  encryption_type      = "CloudDisk"
  tags = {
    Created = "TF1"
    For     = "acceptance test1"
    Updated = "TF"
  }
}
