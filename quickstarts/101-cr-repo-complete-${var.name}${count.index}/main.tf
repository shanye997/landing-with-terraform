resource "alicloud_cr_namespace" "default" {
  name               = "${var.name}"
  auto_create        = false
  default_visibility = "PRIVATE"
}

resource "alicloud_cr_repo" "default" {
  namespace = alicloud_cr_namespace.default.name
  repo_type = var.repo_type_var
  summary   = var.summary_var
  count     = "5"
  name      = "${var.name}${count.index}"
}
