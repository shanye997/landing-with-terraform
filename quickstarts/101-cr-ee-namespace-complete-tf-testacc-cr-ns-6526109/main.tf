data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_ee_namespace" "default" {
  default_visibility = var.default_visibility_var
  instance_id        = data.alicloud_cr_ee_instances.default.ids.0
  name               = "tf-example-cr-ns-6526109"
  auto_create        = var.auto_create_var
}
