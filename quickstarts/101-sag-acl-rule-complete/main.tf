resource "alicloud_sag_acl" "default" {
  name = "${var.name}"
}

resource "alicloud_sag_acl_rule" "default" {
  ip_protocol       = var.ip_protocol_var
  priority          = var.priority_var
  source_cidr       = var.source_cidr_var
  description       = var.description_var
  acl_id            = alicloud_sag_acl.default.id
  dest_port_range   = var.dest_port_range_var
  direction         = var.direction_var
  source_port_range = var.source_port_range_var
  policy            = var.policy_var
  dest_cidr         = var.dest_cidr_var
}
