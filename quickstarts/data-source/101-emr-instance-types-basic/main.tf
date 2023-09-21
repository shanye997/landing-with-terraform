data "alicloud_emr_instance_types" "default" {
  instance_charge_type = var.instance_charge_type_var
  destination_resource = var.destination_resource_var
  cluster_type         = var.cluster_type_var
}
