resource "alicloud_sag_acl" "default" {
  name = "${var.name}"
}

resource "alicloud_sag_acl_rule" "default" {
  dest_port_range   = var.dest_port_range_var
  dest_cidr         = var.dest_cidr_var
  source_cidr       = var.source_cidr_var
  acl_id            = alicloud_sag_acl.default.id
  source_port_range = var.source_port_range_var
  ip_protocol       = var.ip_protocol_var
  direction         = var.direction_var
  policy            = var.policy_var
}
