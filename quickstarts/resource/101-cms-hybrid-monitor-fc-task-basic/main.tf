resource "alicloud_cms_namespace" "default" {
  description   = var.name
  namespace     = "tf-example-cloudmonitorservicenamespace"
  specification = "cms.s1.large"
}

resource "alicloud_cms_hybrid_monitor_fc_task" "default" {
  yarm_config = var.yarm_config_var
  namespace   = alicloud_cms_namespace.default.id
}
