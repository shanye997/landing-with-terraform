resource "alicloud_hbase_instance" "default" {
  name                 = var.name_var
  master_instance_type = var.master_instance_type_var
  engine_version       = "2.0"
  core_instance_type   = var.core_instance_type_var
}
