data "alicloud_gpdb_zones" "default" {
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
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

resource "alicloud_gpdb_instance" "default" {
  db_instance_mode      = "StorageElastic"
  engine_version        = "6.0"
  instance_spec         = var.instance_spec_var
  seg_node_num          = var.seg_node_num_var
  zone_id               = data.alicloud_gpdb_zones.default.ids.0
  seg_storage_type      = var.seg_storage_type_var
  used_time             = var.used_time_var
  vpc_id                = data.alicloud_vpcs.default.ids.0
  create_sample_data    = var.create_sample_data_var
  description           = var.description_var
  instance_network_type = "VPC"
  ip_whitelist {
    security_ip_list = "127.0.0.1"
  }

  period               = var.period_var
  vswitch_id           = local.vswitch_id
  db_instance_category = "HighAvailability"
  engine               = "gpdb"
  storage_size         = var.storage_size_var
  db_instance_class    = "gpdb.group.segsdx1"
  master_node_num      = var.master_node_num_var
  payment_type         = "Subscription"
  private_ip_address   = var.private_ip_address_var
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}
