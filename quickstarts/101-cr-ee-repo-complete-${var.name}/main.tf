data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_ee_namespace" "default" {
  instance_id        = data.alicloud_cr_ee_instances.default.ids.0
  name               = "${var.name}"
  auto_create        = false
  default_visibility = "PRIVATE"
}

resource "alicloud_cr_ee_repo" "default" {
  namespace   = alicloud_cr_ee_namespace.default.name
  repo_type   = var.repo_type_var
  summary     = var.summary_var
  detail      = var.detail_var
  instance_id = data.alicloud_cr_ee_instances.default.ids.0
  name        = var.name
}
