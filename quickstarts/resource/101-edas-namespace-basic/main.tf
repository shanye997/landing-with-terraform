resource "alicloud_edas_namespace" "default" {
  namespace_logical_id = var.logical_id
  namespace_name       = "${var.name}"
}
