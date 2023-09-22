data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_chart_namespace" "default" {
  instance_id    = data.alicloud_cr_ee_instances.default.ids.0
  namespace_name = "tfexamplecn-hangzhou72225"
}
