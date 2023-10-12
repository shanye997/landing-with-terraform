data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_dts_instance" "default" {
  destination_endpoint_engine_name = "MySQL"
  source_endpoint_engine_name      = "MySQL"
  source_region                    = "cn-hangzhou"
  tags = {
    For     = "acceptance test"
    Created = "TF"
  }
  payment_type       = "PayAsYouGo"
  resource_group_id  = data.alicloud_resource_manager_resource_groups.default.ids.1
  destination_region = "cn-hangzhou"
  instance_class     = "large"
  database_count     = var.database_count_var
  sync_architecture  = var.sync_architecture_var
  compute_unit       = var.compute_unit_var
  type               = "migration"
}
