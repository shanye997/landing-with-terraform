resource "alicloud_nas_file_system" "default" {
  protocol_type = "NFS"
  storage_type  = "Capacity"
}

resource "alicloud_nas_lifecycle_policy" "default" {
  paths = [
    "/"
  ]
  storage_type          = "InfrequentAccess"
  file_system_id        = alicloud_nas_file_system.default.id
  lifecycle_policy_name = var.name
  lifecycle_rule_name   = var.lifecycle_rule_name_var
}
