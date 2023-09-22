data "alicloud_elasticsearch_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_elasticsearch_zones.default.ids[length(data.alicloud_elasticsearch_zones.default.ids) - 1]
}

locals {
  vswitch_id = data.alicloud_vswitches.default.ids[0]
}

resource "alicloud_elasticsearch_instance" "default" {
  data_node_amount    = var.data_node_amount_var
  vswitch_id          = local.vswitch_id
  data_node_disk_type = var.data_node_disk_type_var
  version             = "7.16.2_with_X-Pack"
  data_node_disk_size = var.data_node_disk_size_var
  data_node_spec      = var.data_node_spec_var
}
