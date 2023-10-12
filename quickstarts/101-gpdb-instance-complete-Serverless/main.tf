data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = "ap-southeast-1c"
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = "ap-southeast-1c"
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_gpdb_instance" "default" {
  create_sample_data    = var.create_sample_data_var
  instance_network_type = "VPC"
  master_node_num       = var.master_node_num_var
  vswitch_id            = local.vswitch_id
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
  db_instance_mode = "Serverless"
  description      = var.description_var
  instance_spec    = var.instance_spec_var
  seg_node_num     = var.seg_node_num_var
  engine           = "gpdb"
  ip_whitelist {
    security_ip_list = "127.0.0.1"
  }

  payment_type       = "PayAsYouGo"
  private_ip_address = var.private_ip_address_var
  engine_version     = "6.0"
  vpc_id             = data.alicloud_vpcs.default.ids.0
  zone_id            = "ap-southeast-1c"
}
