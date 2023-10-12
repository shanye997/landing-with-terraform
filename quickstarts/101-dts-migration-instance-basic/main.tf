resource "alicloud_dts_migration_instance" "default" {
  source_endpoint_engine_name      = "MySQL"
  source_endpoint_region           = "cn-hangzhou"
  destination_endpoint_region      = "cn-hangzhou"
  destination_endpoint_engine_name = "MySQL"
  payment_type                     = "PayAsYouGo"
}
