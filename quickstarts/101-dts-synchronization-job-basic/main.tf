## DTS Data Synchronization
resource "alicloud_dts_synchronization_instance" "default" {
  payment_type                     = "PayAsYouGo"
  source_endpoint_engine_name      = "PolarDB"
  source_endpoint_region           = var.region_id
  destination_endpoint_engine_name = "MySQL"
  destination_endpoint_region      = var.region_id
  instance_class                   = "small"
  sync_architecture                = "oneway"
}

resource "alicloud_dts_synchronization_job" "default" {
  data_synchronization               = "true"
  source_endpoint_instance_type      = "PolarDB"
  dts_instance_id                    = alicloud_dts_synchronization_instance.default.id
  structure_initialization           = "true"
  destination_endpoint_instance_type = "RDS"
  destination_endpoint_engine_name   = "MySQL"
  data_initialization                = "true"
  source_endpoint_engine_name        = "PolarDB"
  db_list                            = var.db_list_var
  dts_job_name                       = var.dts_job_name_var
}
