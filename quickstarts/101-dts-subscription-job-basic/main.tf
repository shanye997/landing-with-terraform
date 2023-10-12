resource "alicloud_dts_subscription_job" "default" {
  source_endpoint_region        = var.source_endpoint_region_var
  source_endpoint_instance_type = var.source_endpoint_instance_type_var
  source_endpoint_engine_name   = var.source_endpoint_engine_name_var
  payment_type                  = "Subscription"
}
