resource "alicloud_cr_namespace" "default" {
  name               = "${var.name}"
  auto_create        = false
  default_visibility = "PUBLIC"
}

resource "alicloud_cr_repo" "default" {
  namespace = "${alicloud_cr_namespace.default.name}"
  name      = "${var.name}"
  summary   = "OLD"
  repo_type = "PUBLIC"
  detail    = "OLD"
}

data "alicloud_cr_repos" "default" {
  enable_details = var.enable_details_var
  name_regex     = alicloud_cr_repo.default.name
  namespace      = "${alicloud_cr_repo.default.name}_fake"
}
