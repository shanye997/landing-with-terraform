resource "alicloud_sag_qos" "default" {
  name = "${var.name}"
}

resource "alicloud_sag_qos_car" "default" {
  limit_type = var.limit_type_var
  priority   = var.priority_var
  qos_id     = alicloud_sag_qos.default.id
}
