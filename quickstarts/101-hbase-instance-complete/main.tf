data "alicloud_hbase_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_hbase_zones.default.ids.0
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_hbase_zones.default.ids.0
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_security_group" "default" {
  count  = 2
  vpc_id = data.alicloud_vpcs.default.ids.0
  name   = var.name
}

resource "alicloud_hbase_instance" "default" {
  maintain_start_time = var.maintain_start_time_var
  security_groups = [
    alicloud_security_group.default.0.id,
    alicloud_security_group.default.1.id
  ]
  cold_storage_size = var.cold_storage_size_var
  tags = {
    Created = "TF"
    For     = "acceptance test 123"
  }
  core_instance_type    = var.core_instance_type_var
  name                  = var.name_var
  vswitch_id            = local.vswitch_id
  maintain_end_time     = var.maintain_end_time_var
  vpc_id                = data.alicloud_vpcs.default.ids.0
  core_disk_size        = var.core_disk_size_var
  ip_white              = var.ip_white_var
  immediate_delete_flag = var.immediate_delete_flag_var
  password              = var.password_var
  master_instance_type  = var.master_instance_type_var
  deletion_protection   = var.deletion_protection_var
  engine_version        = "2.0"
  core_disk_type        = "cloud_ssd"
  engine                = "hbaseue"
  account               = var.account_var
}
