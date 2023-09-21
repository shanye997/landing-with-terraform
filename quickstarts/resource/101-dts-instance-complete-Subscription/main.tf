data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_dts_instance" "default" {
  auto_start                       = var.auto_start_var
  destination_region               = "cn-hangzhou"
  du                               = var.du_var
  instance_class                   = "large"
  source_endpoint_engine_name      = "MySQL"
  sync_architecture                = var.sync_architecture_var
  type                             = "sync"
  database_count                   = var.database_count_var
  destination_endpoint_engine_name = "MySQL"
  fee_type                         = var.fee_type_var
  period                           = var.period_var
  compute_unit                     = var.compute_unit_var
  payment_type                     = "Subscription"
  resource_group_id                = data.alicloud_resource_manager_resource_groups.default.ids.0
  source_region                    = "cn-hangzhou"
  used_time                        = var.used_time_var
}
