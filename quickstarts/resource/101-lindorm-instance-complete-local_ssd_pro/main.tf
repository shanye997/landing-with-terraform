data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_lindorm_instance" "default_0" {
  instance_name           = var.instance_name_var
  payment_type            = "PayAsYouGo"
  core_spec               = var.core_spec_var
  vswitch_id              = data.alicloud_vswitches.default.ids[0]
  zone_id                 = data.alicloud_zones.default.zones.0.id
  deletion_proection      = var.deletion_proection_var
  table_engine_node_count = var.table_engine_node_count_var
  disk_category           = "local_ssd_pro"
  ip_white_list = [
    "117.117.117.117",
    "116.116.116.116"
  ]
}
