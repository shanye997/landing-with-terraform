resource "alicloud_cr_namespace" "default" {
  name               = "${var.name}"
  auto_create        = false
  default_visibility = "PUBLIC"
}

data "alicloud_cr_namespaces" "default" {
  name_regex = "${alicloud_cr_namespace.default.name}-fake"
}
