resource "alicloud_sag_qos" "default" {
  name = "${var.name}"
}

resource "alicloud_sag_qos_policy" "default" {
  qos_id            = alicloud_sag_qos.default.id
  name              = var.name_var
  priority          = var.priority_var
  dest_port_range   = var.dest_port_range_var
  ip_protocol       = var.ip_protocol_var
  source_cidr       = var.source_cidr_var
  description       = var.description_var
  dest_cidr         = var.dest_cidr_var
  source_port_range = var.source_port_range_var
  start_time        = var.start_time_var
  end_time          = var.end_time_var
}
