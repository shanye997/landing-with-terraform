resource "alicloud_cms_namespace" "default" {
  namespace     = var.name
  specification = var.specification_var
  description   = "${var.name}"
}
