data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_ee_namespace" "default" {
  instance_id        = data.alicloud_cr_ee_instances.default.ids.0
  name               = "${var.name}"
  auto_create        = false
  default_visibility = "PRIVATE"
}

resource "alicloud_cr_ee_repo" "default" {
  count       = "5"
  name        = "${var.name}${count.index}"
  summary     = var.summary_var
  repo_type   = var.repo_type_var
  namespace   = alicloud_cr_ee_namespace.default.name
  instance_id = data.alicloud_cr_ee_instances.default.ids.0
}
