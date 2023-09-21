data "alicloud_emr_instance_types" "default" {
  cluster_type          = var.cluster_type_var
  destination_resource  = var.destination_resource_var
  instance_charge_type  = var.instance_charge_type_var
  support_local_storage = var.support_local_storage_var
  support_node_type = [
    "CORE"
  ]
}
