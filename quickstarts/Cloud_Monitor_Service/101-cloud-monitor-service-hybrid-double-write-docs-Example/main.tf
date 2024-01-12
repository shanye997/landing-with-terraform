resource "alicloud_cms_namespace" "source" {
  namespace = "your_source_namespace"
}

resource "alicloud_cms_namespace" "default" {
  namespace = "your_namespace"
}

resource "alicloud_cloud_monitor_service_hybrid_double_write" "default" {
  source_namespace = alicloud_cms_namespace.source.id
  source_user_id   = "your_source_account"
  namespace        = alicloud_cms_namespace.default.id
  user_id          = "your_account"
}