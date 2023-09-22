resource "alicloud_mongodb_instance" "default" {
  parameters {
    name  = "setParameter.flowControlTargetLagSeconds"
    value = "10"
  }

  engine_version      = "4.2"
  db_instance_storage = var.db_instance_storage_var
  db_instance_class   = var.db_instance_class_var
}
