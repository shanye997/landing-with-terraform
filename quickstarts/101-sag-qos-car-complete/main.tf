resource "alicloud_sag_qos" "default" {
  name = "${var.name}"
}

resource "alicloud_sag_qos_car" "default" {
  priority          = var.priority_var
  qos_id            = alicloud_sag_qos.default.id
  description       = var.description_var
  limit_type        = var.limit_type_var
  max_bandwidth_abs = var.max_bandwidth_abs_var
  min_bandwidth_abs = var.min_bandwidth_abs_var
  name              = var.name_var
}
