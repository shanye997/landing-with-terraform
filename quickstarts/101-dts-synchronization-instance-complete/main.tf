resource "alicloud_dts_synchronization_instance" "default" {
  auto_pay                         = var.auto_pay_var
  auto_start                       = var.auto_start_var
  destination_endpoint_engine_name = "MySQL"
  destination_endpoint_region      = "cn-hangzhou"
  payment_type                     = "PayAsYouGo"
  source_endpoint_engine_name      = "MySQL"
  source_endpoint_region           = "cn-hangzhou"
}
