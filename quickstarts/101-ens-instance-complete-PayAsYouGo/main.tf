resource "alicloud_ens_instance" "default" {
  user_data           = var.user_data_var
  scheduling_strategy = var.scheduling_strategy_var
  carrier             = var.carrier_var
  net_district_code   = var.net_district_code_var
  ens_region_id       = "cn-hefei-cmcc-2"
  system_disk {
    size = "20"
  }

  scheduling_price_strategy = var.scheduling_price_strategy_var
  payment_type              = "PayAsYouGo"
  image_id                  = "centos_6_08_64_20G_alibase_20171208"
  instance_name             = "tf-examplecn-hangzhouensinstance41399"
  public_ip_identification  = var.public_ip_identification_var
  internet_charge_type      = var.internet_charge_type_var
  password                  = var.password_var
  period                    = var.period_var
  data_disk {
    category = "local_ssd"
    size     = "20"
  }

  schedule_area_level        = var.schedule_area_level_var
  host_name                  = "testHost72"
  instance_charge_strategy   = var.instance_charge_strategy_var
  period_unit                = var.period_unit_var
  instance_type              = "ens.sn1.tiny"
  internet_max_bandwidth_out = "100"
}
