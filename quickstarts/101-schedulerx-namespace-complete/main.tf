resource "alicloud_schedulerx_namespace" "default" {
  description    = var.description_var
  namespace_name = var.namespace_name_var
}
