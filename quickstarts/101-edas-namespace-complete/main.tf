resource "alicloud_edas_namespace" "default" {
  debug_enable         = var.debug_enable_var
  description          = "${var.name}"
  namespace_logical_id = var.logical_id
  namespace_name       = "${var.name}"
}
