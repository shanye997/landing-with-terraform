resource "alicloud_dcdn_kv_namespace" "default" {
  description = "wkmtest"
  namespace   = var.name
}

resource "alicloud_dcdn_kv" "default" {
  key       = var.name
  namespace = alicloud_dcdn_kv_namespace.default.namespace
  value     = "${var.name}"
}
