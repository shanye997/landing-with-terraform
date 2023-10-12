resource "alicloud_dcdn_kv_namespace" "default" {
  description = "wkmtest"
  namespace   = var.name
}
