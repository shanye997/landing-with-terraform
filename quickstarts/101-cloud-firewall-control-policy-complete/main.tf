resource "alicloud_cloud_firewall_control_policy" "default" {
  dest_port_type   = var.dest_port_type_var
  acl_action       = var.acl_action_var
  release          = var.release_var
  description      = var.description_var
  source           = var.source_var
  source_type      = var.source_type_var
  dest_port        = var.dest_port_var
  application_name = var.application_name_var
  destination      = var.destination_var
  destination_type = var.destination_type_var
  proto            = var.proto_var
  dest_port_group  = var.dest_port_group_var
  direction        = "out"
}
