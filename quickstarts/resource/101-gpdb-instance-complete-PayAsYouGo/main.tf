data "alicloud_resource_manager_resource_groups" "default" {
}

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

resource "alicloud_kms_key" "key" {
  pending_window_in_days = "7"
  key_state              = "Enabled"
  description            = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_gpdb_instance" "default" {
  zone_id               = data.alicloud_gpdb_zones.default.ids.0
  encryption_type       = "CloudDisk"
  engine_version        = "6.0"
  ssl_enabled           = var.ssl_enabled_var
  master_node_num       = var.master_node_num_var
  db_instance_category  = "HighAvailability"
  instance_network_type = "VPC"
  tags = {
    Created = "TF2"
    For     = "acceptance test2"
  }
  payment_type        = "PayAsYouGo"
  seg_storage_type    = var.seg_storage_type_var
  engine              = "gpdb"
  maintain_start_time = var.maintain_start_time_var
  vpc_id              = data.alicloud_vpcs.default.ids.0
  seg_node_num        = var.seg_node_num_var
  private_ip_address  = var.private_ip_address_var
  resource_group_id   = data.alicloud_resource_manager_resource_groups.default.ids.0
  ip_whitelist {
    ip_group_name    = "default"
    security_ip_list = "10.0.0.1,10.0.0.2"
  }
  ip_whitelist {
    ip_group_attribute = "show"
    ip_group_name      = "test02"
    security_ip_list   = "10.0.0.2,10.0.0.3"
  }
  ip_whitelist {
    ip_group_name      = ""
    security_ip_list   = "10.0.0.1,11.0.0.1"
    ip_group_attribute = "test"
  }

  db_instance_class           = "gpdb.group.segsdx1"
  db_instance_mode            = "StorageElastic"
  vswitch_id                  = local.vswitch_id
  create_sample_data          = var.create_sample_data_var
  description                 = var.description_var
  storage_size                = var.storage_size_var
  vector_configuration_status = var.vector_configuration_status_var
  maintain_end_time           = var.maintain_end_time_var
  encryption_key              = alicloud_kms_key.key.id
  instance_spec               = var.instance_spec_var
}
