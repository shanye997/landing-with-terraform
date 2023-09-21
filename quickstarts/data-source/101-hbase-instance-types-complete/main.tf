data "alicloud_hbase_instance_types" "default" {
  version       = var.version_var
  zone_id       = var.zone_id_var
  charge_type   = var.charge_type_var
  disk_type     = var.disk_type_var
  engine        = var.engine_var
  instance_type = var.instance_type_var
  region_id     = var.region_id_var
}
