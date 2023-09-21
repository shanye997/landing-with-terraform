data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_chart_namespace" "default" {
  default_repo_type = var.default_repo_type_var
  instance_id       = data.alicloud_cr_ee_instances.default.ids.0
  namespace_name    = "tfexamplecn-hangzhou72225"
  auto_create_repo  = var.auto_create_repo_var
}
