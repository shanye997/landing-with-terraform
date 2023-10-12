resource "alicloud_dts_migration_instance" "default" {
  destination_endpoint_engine_name = "MySQL"
  destination_endpoint_region      = "cn-hangzhou"
  instance_class                   = var.instance_class_var
  payment_type                     = "PayAsYouGo"
  source_endpoint_engine_name      = "MySQL"
  source_endpoint_region           = "cn-hangzhou"
  sync_architecture                = "oneway"
  tags = {
    Created = "TF"
    For     = "acceptance-Test"
  }
}
