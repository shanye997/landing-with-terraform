resource "alicloud_cloud_firewall_control_policy" "default" {
  description      = var.description_var
  source_type      = var.source_type_var
  proto            = var.proto_var
  destination      = var.destination_var
  source           = var.source_var
  application_name = var.application_name_var
  direction        = "out"
  acl_action       = var.acl_action_var
  destination_type = var.destination_type_var
}
