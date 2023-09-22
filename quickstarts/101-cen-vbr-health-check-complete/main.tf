data "alicloud_express_connect_physical_connections" "nameRegex" {
  name_regex = "^preserved-NODELETING"
}

resource "alicloud_express_connect_virtual_border_router" "default" {
  local_gateway_ip           = "10.0.0.1"
  peer_gateway_ip            = "10.0.0.2"
  peering_subnet_mask        = "255.255.255.252"
  physical_connection_id     = data.alicloud_express_connect_physical_connections.nameRegex.connections.0.id
  virtual_border_router_name = var.name
  vlan_id                    = 2489
  min_rx_interval            = 1000
  min_tx_interval            = 1000
  detect_multiplier          = 10
}

resource "alicloud_cen_instance" "default" {
  name = "${var.name}"
}

data "alicloud_account" "default" {}

resource "alicloud_cen_vbr_health_check" "default" {
  health_check_source_ip = var.health_check_source_ip_var
  health_check_target_ip = var.health_check_target_ip_var
  healthy_threshold      = var.healthy_threshold_var
  vbr_instance_id        = alicloud_express_connect_virtual_border_router.default.id
  vbr_instance_owner_id  = data.alicloud_account.default.id
  vbr_instance_region_id = "cn-hangzhou"
  cen_id                 = alicloud_cen_instance.default.id
  health_check_interval  = var.health_check_interval_var
}
