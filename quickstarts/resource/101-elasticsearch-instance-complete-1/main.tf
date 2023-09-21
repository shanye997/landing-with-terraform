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
  kibana_private_whitelist = [
    "192.168.0.0/24",
    "127.0.0.1/32"
  ]
  enable_kibana_private_network    = var.enable_kibana_private_network_var
  auto_renew_duration              = var.auto_renew_duration_var
  master_node_disk_type            = var.master_node_disk_type_var
  kibana_node_spec                 = var.kibana_node_spec_var
  data_node_spec                   = var.data_node_spec_var
  password                         = var.password_var
  client_node_spec                 = var.client_node_spec_var
  vswitch_id                       = local.vswitch_id
  description                      = var.description_var
  master_node_spec                 = var.master_node_spec_var
  data_node_disk_performance_level = var.data_node_disk_performance_level_var
  setting_config = {

  }
  kibana_whitelist = [
    "192.168.0.0/24",
    "127.0.0.1/32"
  ]
  version              = "7.16.2_with_X-Pack"
  data_node_amount     = var.data_node_amount_var
  instance_charge_type = var.instance_charge_type_var
  renew_status         = var.renew_status_var
  data_node_disk_size  = var.data_node_disk_size_var
  public_whitelist = [
    "192.168.0.0/24",
    "127.0.0.1/32"
  ]
  period                = var.period_var
  client_node_amount    = var.client_node_amount_var
  zone_count            = "1"
  renewal_duration_unit = var.renewal_duration_unit_var
  data_node_disk_type   = var.data_node_disk_type_var
  private_whitelist = [
    "192.168.0.0/24",
    "127.0.0.1/32"
  ]
  enable_public = var.enable_public_var
  protocol      = var.protocol_var
  tags = {
    For     = "acceptance Test"
    Created = "TF"
  }
}
