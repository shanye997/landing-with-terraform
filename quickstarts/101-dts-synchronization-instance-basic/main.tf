resource "alicloud_dts_synchronization_instance" "default" {
  payment_type                     = "PayAsYouGo"
  destination_endpoint_region      = "cn-hangzhou"
  source_endpoint_region           = "cn-hangzhou"
  destination_endpoint_engine_name = "MySQL"
  source_endpoint_engine_name      = "MySQL"
}
