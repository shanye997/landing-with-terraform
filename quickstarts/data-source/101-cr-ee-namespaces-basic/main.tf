data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_ee_namespace" "default" {
  instance_id        = data.alicloud_cr_ee_instances.default.ids.0
  name               = "${var.name}"
  auto_create        = true
  default_visibility = "PRIVATE"
}

data "alicloud_cr_ee_namespaces" "default" {
  instance_id = alicloud_cr_ee_namespace.default.instance_id
}
