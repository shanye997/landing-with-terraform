resource "alicloud_cr_namespace" "default" {
  name               = "${var.name}"
  auto_create        = false
  default_visibility = "PRIVATE"
}

resource "alicloud_cr_repo" "default" {
  name      = var.name
  namespace = alicloud_cr_namespace.default.name
  repo_type = var.repo_type_var
  summary   = var.summary_var
  detail    = var.detail_var
}
