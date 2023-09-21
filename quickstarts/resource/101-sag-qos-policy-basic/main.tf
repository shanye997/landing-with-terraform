resource "alicloud_sag_qos" "default" {
  name = "${var.name}"
}

resource "alicloud_sag_qos_policy" "default" {
  priority          = var.priority_var
  source_port_range = var.source_port_range_var
  dest_cidr         = var.dest_cidr_var
  dest_port_range   = var.dest_port_range_var
  qos_id            = alicloud_sag_qos.default.id
  source_cidr       = var.source_cidr_var
  ip_protocol       = var.ip_protocol_var
}
