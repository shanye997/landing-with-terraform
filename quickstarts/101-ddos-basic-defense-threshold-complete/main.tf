resource "alicloud_eip_address" "default" {
  address_name         = var.name
  isp                  = "BGP"
  internet_charge_type = "PayByBandwidth"
  payment_type         = "PayAsYouGo"
}

resource "alicloud_ddos_basic_defense_threshold" "default" {
  is_auto       = var.is_auto_var
  pps           = var.pps_var
  bps           = var.bps_var
  ddos_type     = "defense"
  instance_id   = alicloud_eip_address.default.id
  instance_type = "eip"
}
