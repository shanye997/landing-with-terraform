resource "alicloud_cr_namespace" "default" {
  auto_create        = var.auto_create_var
  default_visibility = var.default_visibility_var
  name               = "tf-example-cr-ns-6045677"
}
