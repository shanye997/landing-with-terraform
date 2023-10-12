data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_ee_namespace" "default" {
  count              = "5"
  default_visibility = var.default_visibility_var
  instance_id        = data.alicloud_cr_ee_instances.default.ids.0
  name               = "tf-example-cr-ns-6876886${count.index}"
  auto_create        = var.auto_create_var
}
