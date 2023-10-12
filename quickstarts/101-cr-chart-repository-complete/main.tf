data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_chart_namespace" "default" {
  instance_id    = data.alicloud_cr_ee_instances.default.ids.0
  namespace_name = var.name
}

resource "alicloud_cr_chart_repository" "default" {
  summary             = var.summary_var
  instance_id         = alicloud_cr_chart_namespace.default.instance_id
  repo_name           = "tf-examplecn-hangzhou56903"
  repo_namespace_name = alicloud_cr_chart_namespace.default.namespace_name
  repo_type           = var.repo_type_var
}
