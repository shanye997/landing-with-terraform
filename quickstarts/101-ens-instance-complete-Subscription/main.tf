resource "alicloud_ens_instance" "default" {
  scheduling_price_strategy = var.scheduling_price_strategy_var
  instance_charge_strategy  = var.instance_charge_strategy_var
  payment_type              = "Subscription"
  host_name                 = "testHost80"
  data_disk {
    category = "cloud_efficiency"
    size     = "20"
  }
  data_disk {
    category = "cloud_efficiency"
    size     = "30"
  }
  data_disk {
    category = "cloud_efficiency"
    size     = "40"
  }

  public_ip_identification   = var.public_ip_identification_var
  instance_name              = "tf-examplecn-hangzhouensinstance31353"
  internet_max_bandwidth_out = "100"
  period                     = var.period_var
  user_data                  = var.user_data_var
  ens_region_id              = "cn-wuxi-telecom_unicom_cmcc-2"
  image_id                   = "centos_6_08_64_20G_alibase_20171208"
  internet_charge_type       = var.internet_charge_type_var
  carrier                    = var.carrier_var
  password                   = var.password_var
  period_unit                = var.period_unit_var
  schedule_area_level        = var.schedule_area_level_var
  scheduling_strategy        = var.scheduling_strategy_var
  system_disk {
    size = "20"
  }

  net_district_code = var.net_district_code_var
  instance_type     = "ens.sn1.tiny"
}
