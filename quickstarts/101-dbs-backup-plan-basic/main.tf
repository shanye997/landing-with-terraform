resource "alicloud_dbs_backup_plan" "default" {
  backup_plan_name              = var.name
  source_endpoint_instance_type = "RDS"
  database_type                 = "MySQL"
  instance_class                = "xlarge"
  backup_method                 = "logical"
}
