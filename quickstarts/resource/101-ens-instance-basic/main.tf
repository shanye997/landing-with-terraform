resource "alicloud_ens_instance" "default" {
  payment_type               = "PayAsYouGo"
  internet_max_bandwidth_out = "100"
  schedule_area_level        = var.schedule_area_level_var
  instance_type              = "ens.sn1.tiny"
}
