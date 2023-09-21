data "alicloud_emr_disk_types" "default" {
  cluster_type         = var.cluster_type_var
  destination_resource = var.destination_resource_var
  instance_charge_type = var.instance_charge_type_var
  instance_type        = var.instance_type_var
}
